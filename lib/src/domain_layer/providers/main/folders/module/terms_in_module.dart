import 'package:flutter/cupertino.dart';
import 'package:isar/isar.dart';
import 'package:the_remember/src/repositoris/db_data_source/folder.dart';
import 'package:the_remember/src/repositoris/db_data_source/module.dart';
import 'package:the_remember/src/repositoris/db_data_source/term.dart';
import '../../../../../repositoris/db_data_source/sentence.dart';
import '../../../../../repositoris/db_data_source/term_adding_info.dart';
import '../../../../../urils/db/abstract_entity.dart';
import '../folder_module.dart';
import '../../../../../urils/profilers/abstract.dart';

class TermsInModuleProvider extends ModChangeNotifier {
  late List<TermEntityDbDS>? _termsList ;
  late List<TermEntityDbDS>? _learningIterationTermsList ;
  late  List<TermEntityDbDS>? _changedInLearningIterationTermsList;

  final FolderAndModuleProvider fmPr;
  late Future _initLists;

  @override
  List<CollectionSchema<AbstractEntity>> get classes =>
      [TermEntityDbDSSchema, TermAddingInfoDbDSSchema, SentenceDbDSSchema];

  TermsInModuleProvider({required this.fmPr}): super() {
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
    _termsList!.forEach((element) {
      element.module.value = fmPr.currentModule;
    });

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
