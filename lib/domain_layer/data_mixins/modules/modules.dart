import 'package:flutter/cupertino.dart';
import 'package:isar/isar.dart';

import '../../../repositoris/folder_repository/local_db_data_source/folder.dart';
import '../../../repositoris/module_repository/local_db_data_source/module.dart';
import '../../../ui/pages/modules/modules.dart';
import '../../../urils/db/abstract_entity.dart';
import '../../../urils/db/dbMixins.dart';
import '../../../urils/db/engine.dart';





mixin StartModuleDbMixin
implements
    OpenAndClose3<
        CollectionSchema<FolderDbDS>,
        CollectionSchema<ModuleDbDS>,
        CollectionSchema<TermEntityDbDS>>,
 State<StartModule>,
    GetDataFromDbI{
  late List<FolderDbDS> rootFolders = [];
  late List<ModuleDbDS> rootModules = [];

  void completionData() async {
    await openConn();
    rootModules = (await conn[ConnType.term]!
        .collection<ModuleDbDS>()
        .filter()
        .root_folderIsNull()
        .findAll());
    rootFolders = await conn[ConnType.term]!
        .collection<FolderDbDS>()
        .filter()
        .root_folderIsNull()
        .findAll();
    closeConn();
    this.setState(() => null);
  }

  @override
  void dispose() async {
    // TODO: implement dispose

    closeConn();
    // super.dispose();
  }


}
