

import 'package:flutter/cupertino.dart';
import 'package:isar/isar.dart';
import 'package:the_remember/src/repositoris/db_data_source/folder.dart';
import 'package:the_remember/src/repositoris/db_data_source/module.dart';
import 'package:the_remember/src/repositoris/db_data_source/term.dart';
import '../../repositoris/db_data_source/sentence.dart';
import '../../repositoris/db_data_source/term_adding_info.dart';
import '../../repositoris/db_data_source/user.dart';
import '../../ui/ui_templates/abstract_ui.dart';
import '../../urils/db/abstract_entity.dart';
import '../../urils/db/dbMixins.dart';
import '../../urils/db/engine.dart';
import 'folder_module.dart';


class SubFolderAndModuleProvider with ChangeNotifier, OpenAndClose {
  List<FolderDbDS>? _subFoldersList = null;
  List<ModuleDbDS>? _subModulesList = null;
  final FolderAndModuleProvider fmPr;
  final DFMapper dfMapper;
  late Future _initLists;
  @override
  List<CollectionSchema<AbstractEntity>> get classes => [
    UserDbDSSchema,
    FolderDbDSSchema,
    ModuleDbDSSchema,
    TermEntityDbDSSchema ,
    TermAddingInfoDbDSSchema,
    SentenceDbDSSchema,
  ];

  SubFolderAndModuleProvider(this.dfMapper, {required this.fmPr}){
    _initLists = _initListsFromDB();
  }
  void reInit()  {
    if (_subFoldersList != null && fmPr.currentModule == null){
      _subFoldersList = null;
      _subModulesList = null;
      _initLists = _initListsFromDB();
      notifyListeners();
    }
  }


  List<FolderDbDS>? get subFoldersList => _subFoldersList;
  List<ModuleDbDS>? get subModulesList => _subModulesList;
  Future get initLists => _initLists;

  Future<void> _initListsFromDB() async{
    if (fmPr.currentModule == null) {
      var isar = await openConn();
      if (fmPr.currentFolder == null) {
        _subFoldersList = await isar
            .collection<FolderDbDS>()
            .filter()
            .rootFolderIsNull()
            .userUuidEqualTo(fmPr.userPr.user!.uuid)
            .findAll();
        _subModulesList = await isar
            .collection<ModuleDbDS>()
            .filter()
            .rootFolderIsNull()
            .userUuidEqualTo(fmPr.userPr.user!.uuid)
            .findAll();
      } else {
      _subFoldersList = await isar
          .collection<FolderDbDS>()
          .filter()
          .rootFolder((q) => q.isarIdEqualTo(fmPr.currentFolder!.isarId))
          .userUuidEqualTo(fmPr.userPr.user!.uuid)
          .findAll();
      _subModulesList = await isar
          .collection<ModuleDbDS>()
          .filter()
          .rootFolder((q) => q.isarIdEqualTo(fmPr.currentFolder!.isarId))
          .userUuidEqualTo(fmPr.userPr.user!.uuid)
          .findAll();
      }
      notifyListeners();
      await closeConn ();
    } else {
      _subFoldersList = [];
      _subModulesList = [];
      notifyListeners();
    }


  }

  void changed(){
    notifyListeners();
  }


}