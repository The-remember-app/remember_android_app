import 'package:flutter/cupertino.dart';
import 'package:isar/isar.dart';
import 'package:the_remember/src/repositoris/db_data_source/folder.dart';
import 'package:the_remember/src/repositoris/db_data_source/module.dart';
import 'package:the_remember/src/repositoris/db_data_source/term.dart';
import '../../repositoris/db_data_source/sentence.dart';
import '../../repositoris/db_data_source/term_adding_info.dart';
import '../../urils/db/abstract_entity.dart';
import '../../urils/db/dbMixins.dart';
import '../../urils/db/engine.dart';
import 'folder_module.dart';

class TermsInModuleProvider with ChangeNotifier, OpenAndClose {
  List<TermEntityDbDS>? _termsList = null;
  final FolderAndModuleProvider fmPr;
  late Future _initLists;

  @override
  List<CollectionSchema<AbstractEntity>> get classes =>
      [TermEntityDbDSSchema, TermAddingInfoDbDSSchema, SentenceDbDSSchema];

  TermsInModuleProvider({required this.fmPr}) {
    _initLists = _initListsFromDB();
  }

  List<TermEntityDbDS>? get termsList => _termsList;

  Future get initLists => _initLists;

  Future<void> _initListsFromDB() async {
    var isar = await openConn();
    _termsList = await isar
        .collection<TermEntityDbDS>()
        .filter()
        .moduleUuidEqualTo(fmPr.currentModule!.uuid)
        .userUuidEqualTo(fmPr.userPr.user!.uuid)
        .findAll();

    notifyListeners();
    await closeConn();
  }
}
