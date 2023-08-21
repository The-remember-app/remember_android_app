import 'package:flutter/cupertino.dart';
import 'package:isar/isar.dart';

import '../../../repositoris/db_data_source/folder.dart';
import '../../../repositoris/db_data_source/module.dart';
import '../../../repositoris/db_data_source/term.dart';
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
        .rootFolderIsNull()
        .findAll());
    rootFolders = await conn[ConnType.term]!
        .collection<FolderDbDS>()
        .filter()
        .rootFolderIsNull()
        .findAll();
    closeConn();
    this.setState(() => null);
  }

  // @override
  // void dispose() async {
  //   // TODO: implement dispose
  //
  //   // closeConn();
  //   // super.dispose();
  // }


}
