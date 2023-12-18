import 'dart:isolate';

import 'package:isar/isar.dart';
import 'package:the_remember/network_processor/entities_update/folder_update.dart';
import 'package:the_remember/network_processor/url_controller/auth_extension.dart';
import 'package:the_remember/network_processor/url_controller/main.dart';

import '../src/domain_layer/providers/isolates/network.dart';
import '../src/repositoris/db_data_source/http_utils.dart';
import '../src/repositoris/db_data_source/user.dart';
import '../src/urils/db/dbMixins.dart';
import '../src/urils/db/engine.dart';
import '../src/urils/isolate/base_msg.dart';
import '../src/urils/isolate/msgs/login_user.dart';
import '../src/urils/isolate/isolate_ listner.dart';
import 'network_errors.dart';

Future<void> runNetworkIsolate(SendPort callerSendPort) async {
  ReceivePort newIsolateReceivePort = ReceivePort();
  callerSendPort.send(newIsolateReceivePort.sendPort);

  CrossIsolatesMessage dbPath =  await newIsolateReceivePort.first as CrossIsolatesMessage;
  IzarManager.instance.dbExternalPath = dbPath.message as String;

  newIsolateReceivePort.listen(IsolateMessageListener.instance.mainListener);

  var networkProcessor = NetworkProcessor();
  networkProcessor.run(callerSendPort, newIsolateReceivePort);
}

class NetworkProcessor with OpenAndClose {
  static final NetworkProcessor instance = NetworkProcessor._internal();

  late final  Stream<CrossIsolatesMessage<LoginUserIsolateMsg>> userPassListener ;

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

  NetworkProcessor._internal(){
    userPassListener = IsolateMessageListener.instance.getMessageStream<LoginUserIsolateMsg>(CrossIsolatesMessageType.userAndPassword);
  }

  factory NetworkProcessor() {
    return instance;
  }

  Future<void> run(SendPort callerSendPort, ReceivePort newIsolateReceivePort) async {
    var isar = await openConn();
    await findActiveUserInDb(isar);
    userActiveControlLoopRun(isar);
    await multiUsersLoop(isar);
    await closeConn();
  }

  Future<void> findActiveUserInDb(Isar isar) async {
    // await Future.delayed(Duration(seconds: 1000));
    // IsarCollectionImpl<UserDbDS> userQu = isar.collection<UserDbDS>();
    // userQu.wh
    // userQu.
    List<UserDbDS> activeUsers = (await isar
        .collection<UserDbDS>()
        // .where()
        .filter()
        .activeEqualTo(true)
        .findAll());
    activeUsers = activeUsers.where((element) => element.active).toList();
    if (activeUsers.length == 1 && activeUsers[0].active) {
      activeUser = activeUsers[0];
    } else {
      activeUser = null;
    }
  }

  Future<void> userActiveControlLoopRun(Isar isar) async {
    while (true) {
      await Future.delayed(Duration(seconds: 1000));
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
        var urlsGen = await getConnectionUrls(isar);
        await getAuthHeaders(urlsGen);
        await updateDbEntitiesFromServer(isar, urlsGen);
      } catch (UserNotActiveException) {
        // TODO: ждём сообщения от главного потока
        //  с логином и паролем пользователя
      }
    }
  }

  Future<Stream<UnaryUrlController> Function()> getConnectionUrls(
      Isar isar) async {
    var serverUrlsEntities =
        (await isar.collection<HttpUtilsDbDS>().where().findAll());
    // var user = (await conn[ConnType.user]!
    //     .collection<UserDbDS>()
    //     .getByUuid(userApi!.user!.uuid));
    var urlsController = UrlsController(serverUrlsEntities);

    return urlsController.activeApis;
    // var futures = [for (var i in serverUrls) webProtocolDecorator() ]
    // serverUrls.forEach((url) async => await testServerUrl(
    //     url, goodUrlFounded, username, password, userApi, onErrorCallback));
  }

  Future<void> getAuthHeaders(
      Stream<UnaryUrlController> Function() urlsGen) async {
    List<Map<String, String>> res = [];

    await for (var urlC in urlsGen()) {
      try {
        res.add(await urlC.auth(activeUser.username, activeUser.password));
      } catch (AuthErrorUserPasswordNotCorrect) {
        // TODO: если  ни от одной ссылки  не вернулось ответа 200,
        //  то возвращаем сообщение в главный поток о том,
        //  что неверный username или password
      } catch (AuthErrorUserPasswordNotCorrect) {
        // FIXME: отлавливать ошибк connection timeout.
        //  поидее тут таких быть не должно,
        //  т.к. мы итерируемся только по активным ссылкам,
        //  но вдруг попадётся
      }

      if (res.isEmpty) {
        // TODO: возвращаем сообщение в главный поток о том,
        //  что неверный username или password
        throw UserNotActiveException();
      }
    }
  }

  Future<void> updateDbEntitiesFromServer(
      Isar isar, Stream<UnaryUrlController> Function() urlsGen) async {
    folderUpdate(isar, urlsGen);
    // modules_update();
    // terms_update();
    // sentenses_update();
    // add_term_info_update();
    // term_marks_update();
    throw UnimplementedError();

  }
}
