import 'package:isar/isar.dart';
import 'package:the_remember/src/domain_layer/providers/main/folders/sub_folder_modules.dart';
import 'package:the_remember/src/repositoris/db_data_source/folder.dart';
import 'package:the_remember/src/repositoris/db_data_source/module.dart';
import 'package:the_remember/src/repositoris/db_data_source/term.dart';

import '../../../../urils/db/abstract_entity.dart';
import '../../../../urils/profilers/abstract.dart';

class FolderStats {
  final int write;
  final int choice;
  final int watch;
  final int all;

  FolderStats(this.write, this.choice, this.watch, this.all);
}

class FolderProgressBarProvider extends ModChangeNotifier {
  // late List<FolderDbDS>? _subFoldersList ;
  // late List<ModuleDbDS>? _subModulesList ;
  final SubFolderAndModuleProvider subFmPr;

  // final DFMapper dfMapper;
  late Future _dbTransaction;
  late Map<FolderOrModule, List<ModuleDbDS>> _getPersonalStats = Map();
  late Map<ModuleDbDS, FolderStats> _getModuleState;

  FolderProgressBarProvider(this.subFmPr) : super() {}

  @override
  void init({bool isRealInit = false}) {
    // if (_subFoldersList != null && fmPr.currentModule == null){
    // _subFoldersList = null;
    // _subModulesList = null;
    if (parentProvidersList[subFmPr.runtimeType] == null || parentProvidersList[subFmPr.runtimeType] != subFmPr || _getPersonalStats.isNotEmpty) {
      _getPersonalStats = Map();
      _dbTransaction = _getStats();
      parentProvidersList[subFmPr.runtimeType] = subFmPr;
    }
    super.init(isRealInit: isRealInit);
  }

  // List<FolderDbDS>? get subFoldersList => _subFoldersList;
  //
  // List<ModuleDbDS>? get subModulesList => _subModulesList;
  //
  // Future get initLists => _initLists;

  void _addToTree(
      List<FolderOrModule> data, Map<String, List<FolderOrModule>> tree) {
    for (var i in data) {
      tree[i.rootFolderUuid!] =(tree[i.rootFolderUuid] ?? <FolderOrModule>[]) +  <FolderOrModule>[i as FolderOrModule];
    }
  }

  Future<FolderStats> getFolderOrModuleStats(FolderOrModule targetObj) async {
    var res = await _dbTransaction;
    // _getPersonalStats.containsKey(targetObj)
    var statesList = [
      for (var i in _getPersonalStats[targetObj]!) _getModuleState[i]
    ];
    return FolderStats(
        statesList.map<int>((i) => i!.write).reduce((a, b) => a + b),
        statesList.map<int>((i) => i!.choice).reduce((a, b) => a + b),
        statesList.map<int>((i) => i!.watch).reduce((a, b) => a + b),
        statesList.map<int>((i) => i!.all).reduce((a, b) => a + b));
  }

  Future<void> _getStats() async {
    await subFmPr.initLists;
    var isar = await openConn();

    var subFolderList = [for (var i in subFmPr.subFoldersList!) i];
    List<FolderDbDS> allFolderList = [for (var i in subFmPr.subFoldersList!) i];
    Map<String, List<FolderOrModule>> subFolderTree = {
      for (var i in subFolderList) i.uuid: <FolderOrModule>[]
    };
    List<FolderDbDS> nextSubFolderList = [];

    late Future<List<ModuleDbDS>> modules = (() async => <ModuleDbDS>[])();
    List<ModuleDbDS> allModules = [for (var i in subFmPr.subModulesList!) i];

    while (subFolderList.isNotEmpty) {
      var subFolderUuidList = [for (var i in subFolderList) i.uuid];
      var currModulesList = await modules;
      var folders = isar
          .collection<FolderDbDS>()
          // .where((e) => subFolderUuidList.contains(e.rootFolderUuid))
          .filter()
          .anyOf(subFolderUuidList,
              (q, element) => q.rootFolderUuidEqualTo(element))
          // .anyOf([for(var i in subFolderList) i.uuid], FilterRepeatModifier())
          // .userUuidEqualTo(fmPr.userPr.user!.uuid)
          .findAll();
      allModules += currModulesList;
      _addToTree(currModulesList, subFolderTree);
      nextSubFolderList = await folders;
      allFolderList += nextSubFolderList;

      modules = isar
          .collection<ModuleDbDS>()
          // .where((e) => subFolderUuidList.contains(e.rootFolderUuid))
          .filter()
          .anyOf(subFolderUuidList,
              (q, element) => q.rootFolderUuidEqualTo(element))
          // .anyOf([for(var i in subFolderList) i.uuid], FilterRepeatModifier())
          // .userUuidEqualTo(fmPr.userPr.user!.uuid)
          .findAll();
      _addToTree(nextSubFolderList, subFolderTree);
      subFolderList = nextSubFolderList;
    }
    var currModulesList = await modules;
    allModules += currModulesList;
    _addToTree(currModulesList, subFolderTree);
    var moduleStats = {
      for (var i in allModules) i: await i.getLearnProcess(isar)
    };
     await closeConn();

    var notComputedFoldersCount = subFolderTree.length;
    Map<String, List<ModuleDbDS>> computedFolders = {};
    while (notComputedFoldersCount != 0) {
      for (var i in subFolderTree.entries) {
        if (!computedFolders.containsKey(i.key)) {
          if (i.value.isEmpty) {
            computedFolders[i.key] = [];
            notComputedFoldersCount -= 1;
          } else if (i.value.every((element) =>
              (element is ModuleDbDS) ||
              (computedFolders.containsKey(element.uuid)))) {
            computedFolders[i.key] = [];
            notComputedFoldersCount -= 1;
            for (var ii in i.value) {
              if (ii is ModuleDbDS) {
                computedFolders[i.key]!.add(ii as ModuleDbDS);
              } else {
                computedFolders[i.key]!.addAll(computedFolders[ii.uuid]!);
              }
            }
          }
        }
      }
    }
    // await coro;
    _getPersonalStats = {
      for (var i in allFolderList) i: computedFolders[i.uuid]!
    };
    _getPersonalStats.addAll({
      for (var i in allModules) i: [i]
    });
    _getModuleState = {
      for(var i in
      {for (var i in allModules) i: moduleStats[i]! }.entries)
        i.key: FolderStats(i.value.$1, i.value.$2, i.value.$3, i.value.$4)
    };

    // var terms = await isar
    //     .collection<TermEntityDbDS>()
    //     .filter()
    //     .anyOf([for (var i in allModules) i.uuid ], (q, element) => q.moduleUuidEqualTo(element))
    //     .userUuidEqualTo(subFmPr.fmPr.userPr.user!.uuid)
    //     .findAll();

    // Map<ModuleDbDS, List<TermEntityDbDS>> terms

    notifyListeners();

  }

  void changed() {
    notifyListeners();
  }

// @override
// void dispose() {
//   fmPr.subFolderPr = null;
//   super.dispose();
// }

// @override
// void notifyListeners() {
//   super.notifyListeners();
// }
}
