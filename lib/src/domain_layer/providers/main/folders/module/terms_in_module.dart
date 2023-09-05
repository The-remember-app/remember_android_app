import 'package:isar/isar.dart';
import 'package:the_remember/src/repositoris/db_data_source/module.dart';
import 'package:the_remember/src/repositoris/db_data_source/term.dart';

import '../../../../../repositoris/db_data_source/sentence.dart';
import '../../../../../repositoris/db_data_source/term_adding_info.dart';
import '../../../../../urils/db/abstract_entity.dart';
import '../../../../../urils/profilers/abstract.dart';
import '../folder_module.dart';

class TermsInModuleProvider extends ModChangeNotifier {
  late List<TermEntityDbDS>? _termsList;

  late List<TermEntityDbDS>? _learningIterationTermsList;

  late List<TermEntityDbDS>? _changedInLearningIterationTermsList;

  final FolderAndModuleProvider fmPr;
  late Future _initLists;

  @override
  List<CollectionSchema<AbstractEntity>> get classes =>
      [TermEntityDbDSSchema, TermAddingInfoDbDSSchema, SentenceDbDSSchema];

  TermsInModuleProvider({required this.fmPr}) : super() {
    // init();
  }

  @override
  void init({bool isRealInit = false}) {
    _initLists = _initListsFromDB();
    _termsList = null;
    _learningIterationTermsList = null;
    _changedInLearningIterationTermsList = null;
    super.init(isRealInit: isRealInit);
  }

  List<TermEntityDbDS>? get termsList => _termsList;

  Future get initLists => _initLists;

  Future<void> _initListsFromDB() async {
    var isar = await openConn();
    // var module = await isar
    //     .collection<ModuleDbDS>()
    //     .filter()
    //     .uuidEqualTo(fmPr.currentModule!.uuid)
    //     .userUuidEqualTo(fmPr.userPr.user!.uuid)
    //     .findAll();
    // await module[0].words.load();
    // _termsList = module[0].words.toList();
    _termsList = await isar
        .collection<TermEntityDbDS>()
        .filter()
        .module((q) => q.uuidEqualTo(fmPr.currentModule!.uuid))
        .moduleUuidEqualTo(fmPr.currentModule!.uuid)
        .userUuidEqualTo(fmPr.userPr.user!.uuid)
        .findAll();
    var uuidTermList = {for (var i in _termsList!) i.uuid: i};
    var addTermsInfoEntities = await isar
        .collection<TermAddingInfoDbDS>()
        .filter()
        .anyOf(
            uuidTermList.keys, (q, String termUuid) => q.termUuidEqualTo(termUuid))
        .userUuidEqualTo(fmPr.userPr.user!.uuid)
        .findAll();
    var sentenceEntities = await isar
        .collection<SentenceDbDS>()
        .filter()
        .anyOf(
        uuidTermList.keys, (q, String termUuid) => q.termUuidEqualTo(termUuid))
        .userUuidEqualTo(fmPr.userPr.user!.uuid)
        .findAll();

    Map<String, List<TermAddingInfoDbDS>> addTermsInfoEntitiesMap = {};
    Map<String, List<SentenceDbDS>> sentenceEntitiesMap = {};
    for (var i in addTermsInfoEntities){
      addTermsInfoEntitiesMap[i.termUuid] = (addTermsInfoEntitiesMap[i.termUuid] ?? [])
        ..add(i);
      i.termEntity.value = uuidTermList[i.termUuid]!;
    }
    for (var i in sentenceEntities){
      sentenceEntitiesMap[i.termUuid] = (sentenceEntitiesMap[i.termUuid] ?? [])
        ..add(i);
      i.termEntity.value = uuidTermList[i.termUuid]!;
    }

   for(var element in  _termsList!) {
      element.module.value = fmPr.currentModule;
      // element.addInfoEntities = (addTermsInfoEntitiesMap[element.uuid]!);
      element.addInfoEntities.addAll(addTermsInfoEntitiesMap[element.uuid]!);
      element.sentenceEntities.addAll(sentenceEntitiesMap[element.uuid] ?? []);
      await element.addInfoEntities.load();
      await element.sentenceEntities.load();
    }

    // await _termsList![0].module.load();
    // _termsList![0].module.

    notifyListeners();
    await closeConn();
  }

  List<TermEntityDbDS>? get changedInLearningIterationTermsList =>
      _changedInLearningIterationTermsList;

  set changedInLearningIterationTermsList(List<TermEntityDbDS>? value) {
    _changedInLearningIterationTermsList = value;
  }

  List<TermEntityDbDS>? get learningIterationTermsList =>
      _learningIterationTermsList;

  set learningIterationTermsList(List<TermEntityDbDS>? value) {
    _learningIterationTermsList = value;
  }
}
