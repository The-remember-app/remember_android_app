import 'package:built_value/json_object.dart';
import 'package:dio/dio.dart';
import 'package:isar/isar.dart';

import '../src/repositoris/db_data_source/http_utils.dart';
import '../src/repositoris/db_data_source/user.dart';
import '../src/urils/db/dbMixins.dart';

Future<void> runNetworkIsolate() async {
  var networkProcessor = NetworkProcessor();
  networkProcessor.run();
}

class UserNotActiveException implements Exception {
  UserNotActiveException();
}

class NetworkProcessor with OpenAndClose {
  static final NetworkProcessor instance = NetworkProcessor._internal();

  UserDbDS? _activeUser;

  UserDbDS get activeUser {
    if (_activeUser == null) {
      throw UserNotActiveException();
    }
    return _activeUser!;
  }

  set activeUser(UserDbDS? value) {
    _activeUser = value;
  }

  NetworkProcessor._internal();

  factory NetworkProcessor() {
    return instance;
  }

  Future<void> run() async {
    var isar = await openConn();
    await findActiveUserInDb(isar);
    userActiveControlLoopRun(isar);
    await multiUsersLoop(isar);
    await closeConn();
  }

  Future<void> findActiveUserInDb(isar)async{
    var activeUsers = (await isar
        .collection<UserDbDS>()
        .filter()
        .activeEqualTo(true)
        .findAll());
    if (activeUsers.length == 1 && activeUsers[0].active) {
      activeUser = activeUsers[0];
    } else {
      activeUser = null;
    }
  }


  Future<void> userActiveControlLoopRun(Isar isar) async {

    while (true) {
      // TODO: Подписаться на изменение таблицы пользователей
      //  и при появлении активного пользователя делать запросы
      //  ко всем возможным апишкам. для получения токена доступа.
      //  При деактивации (выходе из аккаунта) удалять
      //  все существующие апи ключи, отменять все запросы
      throw UnimplementedError();
    }
  }

  Future<void> multiUsersLoop(Isar isar) async {
    while (true) {
      try {
        // code that may cause an exception
      } catch (UserNotActiveException) {
        // TODO: ждём сообщения от главного потока
        //  с логином и паролем пользователя
      }
    }
  }

  Stream<Future<void>> getConnectionUrls(Isar isar)async*{
    var serverUrlsEntities = (await isar
        .collection<HttpUtilsDbDS>()
        .where()
        .findAll());
    // var user = (await conn[ConnType.user]!
    //     .collection<UserDbDS>()
    //     .getByUuid(userApi!.user!.uuid));
    var serverUrls = [for (var i in serverUrlsEntities) i.httpUrl];
  }


  Future<T> webProtocolDecorator<T extends Response<JsonObject>>(
      Future<T> networkQuery, {int targetStatusCode = 200} ) async {
    var networkQueryNew =  networkQuery
        .then((value) {
      if (value.statusCode == targetStatusCode) {
        return Future<T?>.value(value);
      }
      throw 'Bad';
    }).catchError((error, stackTrace)
    {
      return null;
    }, test: (error) {
      if (error is UserNotActiveException){
        return false;
      }
      else if (error is DioException){
        return true;
      }
      return (error is int && error >= 400);

    });
    return networkQuery;
  }


}
