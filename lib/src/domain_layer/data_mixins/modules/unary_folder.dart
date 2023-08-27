import 'package:flutter/cupertino.dart';
import 'package:isar/isar.dart';

import '../../../repositoris/db_data_source/folder.dart';
import '../../../repositoris/db_data_source/module.dart';
import '../../../repositoris/db_data_source/term.dart';
import '../../../ui/pages/modules/unary_folder.dart';
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
  late FolderDbDS? rootFolderEntity = null;

  @override
  void completionData() async {
    await openConn();
    currModules = (await conn[ConnType.term]!
        .collection<ModuleDbDS>()
        .filter()
        // .not().root_folderIsNull()
        .rootFolder((q) => q.isarIdEqualTo(folderId))
        .findAll());
    subFolders = await conn[ConnType.term]!
        .collection<FolderDbDS>()
        .filter()
        .rootFolder((q) => q.isarIdEqualTo(folderId))
        .findAll();
    folderEntity = await conn[ConnType.term]!
        .collection<FolderDbDS>().get(folderId);
    if (folderEntity!.rootFolderUuid != null){
      rootFolderEntity = (await conn[ConnType.term]!
          .collection<FolderDbDS>()
      .getByComplexIndex([folderEntity!.rootFolderUuid!, folderEntity!.userUuid])
          // .getByUuid(folderEntity!.rootFolderUuid!)
      );
    }
    await closeConn();
    this.setState(() => null);

  }
  @override
  void dispose() async {
    // TODO: implement dispose


    // super.dispose();
  }

}
