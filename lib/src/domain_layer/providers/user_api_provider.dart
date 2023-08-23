import 'package:flutter/cupertino.dart';
import 'package:isar/isar.dart';

import '../../../api_package/lib/api_package.dart';
import '../../../network_processor/network_main.dart';
import '../../repositoris/db_data_source/http_utils.dart';
import '../../repositoris/db_data_source/user.dart';
import '../../urils/db/dbMixins.dart';
import '../../urils/db/engine.dart';


class UserApiProfile with ChangeNotifier {
  UserDbDS? _user = null;
  ApiPackage? _baseApi = null;
  Map<String, String> _authHeaders = {};

  Map<String, String> get authHeaders => _authHeaders;

  set authHeaders(Map<String, String> value) {
    _authHeaders = value;
  }

  ApiPackage? get baseApi => _baseApi;

  set baseApi(ApiPackage? value) {
    _baseApi = value;
  }

  UserDbDS? get user {
    return _user;
  }

  set user(UserDbDS? user) {
    if (this._user != user) {
      this._user = user;
      if (user != null){
        networkProcessor(this);
      }

      notifyListeners();
    }
  }
  void userChange(){
    notifyListeners();
  }

  static Future<UserDbDS?> getUser(UserApiProfile? userApi) async {
    if (userApi?.user != null && userApi!.user!.active) {
      return userApi.user;
    } else {
      // await Future.delayed(Duration(seconds: 5));
      var conn = (await OpenAndClose3.openConnStatic([
        CollectionSchema<UserDbDS>,
        CollectionSchema<HttpUtilsDbDS>,
      ]));
      var activeUsers = (await conn[ConnType.user]!
          .collection<UserDbDS>()
          .filter()
          .activeEqualTo(true)
          .findAll());
      if (activeUsers.length > 1 || (userApi?.user != null && !userApi!.user!.active)) {
        for (var u in activeUsers) {
          u.active = false;
        }
        activeUsers += [userApi!.user!, userApi.user!];
        (await conn[ConnType.user]!.writeTxn(() async {
          (await conn[ConnType.user]!.collection<UserDbDS>().putAll(activeUsers));
        }));
      }
      // if (userApi?.baseApi == null) {
      //   var serverUrls = (await conn[ConnType.server_urls]!
      //       .collection<HttpUtilsDbDS>()
      //       .where()
      //       .findAll());
      //   serverUrls.forEach((element) async { await networkProcessor(element.httpUrl, userApi); });
      //   // networkProcessor([for (var i in serverUrls) i.httpUrl]);
      // } else {
      //
      // }

      var coro =  OpenAndClose3.closeConnStatic(conn);


      UserDbDS? currentUser;
      if (activeUsers.isEmpty || activeUsers.length > 1) {
        currentUser = null;
      } else {
        currentUser = activeUsers[0];
      }
      return currentUser;
    }
  }
}