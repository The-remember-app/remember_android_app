import 'package:flutter/cupertino.dart';
import 'package:isar/isar.dart';
import 'package:the_remember/ui/pages/modules/unary_folder.dart';

import '../../../repositoris/folder_repository/local_db_data_source/folder.dart';
import '../../../repositoris/module_repository/local_db_data_source/module.dart';
import '../../../ui/pages/modules/modules.dart';
import '../../../urils/db/abstract_entity.dart';
import '../../../urils/db/dbMixins.dart';
import '../../../urils/db/engine.dart';


abstract class UnaryFolderI{
   late int folderId;
   // UnaryFolderI(this.folderId);
}




mixin UnaryFolderDbMixin
implements
    OpenAndClose3<CollectionSchema<FolderDbDS>,
        CollectionSchema<ModuleDbDS>,
        CollectionSchema<TermEntityDbDS>>,
    State<UnaryFolder>,
    UnaryFolderI,
    GetDataFromDbI
{
  late List<FolderDbDS> subFolders = [];
  late List<ModuleDbDS> currModules = [];
  late FolderDbDS? folderEntity = null;

  @override
  void completionData() async {
    await openConn();
    currModules = (await conn[ConnType.term]!
        .collection<ModuleDbDS>()
        .filter()
        // .not().root_folderIsNull()
        .root_folder((q) => q.idEqualTo(folderId))
        .findAll());
    subFolders = await conn[ConnType.term]!
        .collection<FolderDbDS>()
        .filter()
        .root_folder((q) => q.idEqualTo(folderId))
        .findAll();
    folderEntity = await conn[ConnType.term]!
        .collection<FolderDbDS>().get(folderId);
    this.setState(() => null);

  }
  @override
  void dispose() async {
    // TODO: implement dispose

    closeConn();
    // super.dispose();
  }

}
