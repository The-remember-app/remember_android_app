import 'package:flutter/cupertino.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';
import 'package:the_remember/src/repositoris/db_data_source/user.dart';

import '../../../../main.dart';
import '../../../repositoris/db_data_source/folder.dart';
import '../../../repositoris/db_data_source/module.dart';
import '../../../repositoris/db_data_source/term.dart';
import '../../../ui/pages/modules/modules.dart';
import '../../../urils/db/abstract_entity.dart';
import '../../../urils/db/dbMixins.dart';
import '../../../urils/db/engine.dart';

mixin StartModuleDbMixin
    implements
        OpenAndClose3<CollectionSchema<FolderDbDS>,
            CollectionSchema<ModuleDbDS>, CollectionSchema<UserDbDS>>,
        State<StartModule>,
        GetDataFromDbI {
  late List<FolderDbDS> rootFolders = [];
  late List<ModuleDbDS> rootModules = [];

  void completionData() async {
    // var userApi =  Provider.of<UserApiProfile>(context, listen: false);
    await openConn();
    var users = (await conn[ConnType.user]!
        .collection<UserDbDS>()
        .filter()
        .activeEqualTo(true)
        .findAll());
    if (users.length == 1) {
      var user = users[0];

      rootModules = (await conn[ConnType.module]!
          .collection<ModuleDbDS>()
          .filter()
          .rootFolderIsNull()
          .userUuidEqualTo(user.uuid)
          .findAll());
      rootFolders = await conn[ConnType.module]!
          .collection<FolderDbDS>()
          .filter()
          .rootFolderIsNull()
          .userUuidEqualTo(user.uuid)
          .findAll();
    }
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
