import 'package:flutter/cupertino.dart';
import 'package:isar/isar.dart';

import '../../../network_processor/network_main.dart';
import '../../repositoris/db_data_source/http_utils.dart';
import '../../repositoris/db_data_source/user.dart';
import '../../urils/db/abstract_entity.dart';
import '../../urils/db/dbMixins.dart';
import '../../urils/db/engine.dart';
import '../pages/await_user_screen.dart';






mixin StartLoginingScreenDbMixin
implements
    OpenAndClose3<
        CollectionSchema<UserDbDS>,
        CollectionSchema<HttpUtilsDbDS>,
        CollectionSchema<AbstractEntity>>,
    State<AwaitUserScreen>,
    GetDataFromDbI{
  late UserDbDS? currentUser = null;
  late List<HttpUtilsDbDS> serverUrls = [];
  late bool dbWorkCompleted = false;
  late Function? dbWorkCallback = null;

  void completionData() async {
    // await Future.delayed(Duration(seconds: 5));
    // await openConn();
    // var activeUsers = (await conn[ConnType.user]!
    //     .collection<UserDbDS>()
    //     .filter()
    //     .activeEqualTo(true)
    //     .findAll());
    // if (activeUsers.length > 1){
    //   for (var u in activeUsers){
    //     u.active = false;
    //   }
    //   (await conn[ConnType.user]!
    //       .collection<UserDbDS>().putAll(activeUsers));
    // }
    // var serverUrls = (await conn[ConnType.server_urls]!
    //     .collection<HttpUtilsDbDS>()
    //     .where()
    //     .findAll());
    // networkProcessor([for(var i in serverUrls) i.httpUrl]);
    //
    //
    //
    // closeConn();
    // dbWorkCompleted = true;
    // if (activeUsers.isEmpty || activeUsers.length > 1){
    //
    //   dbWorkCallback = (BuildContext context) =>
    //       Navigator.pushNamed(
    //         context,
    //         '/login_screen',
    //         arguments: Map<String, dynamic>(),
    //       );
    //
    //
    //
    // } else {
    //   currentUser = activeUsers[0];
    //   dbWorkCallback = (BuildContext context) =>
    //       Navigator.pushNamed(
    //         context,
    //         '/root_folder',
    //         arguments: Map<String, dynamic>(),
    //       );
    // }
    // this.setState(() => null);
  }

  @override
  void dispose() async {
    // TODO: implement dispose

    // closeConn();
    // super.dispose();
  }


}
