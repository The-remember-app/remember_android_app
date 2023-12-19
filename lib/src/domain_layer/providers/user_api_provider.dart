import 'package:isar/isar.dart';
import 'package:the_remember/src/urils/db/abstract_entity.dart';

import '../../../api_package/lib/api_package.dart';
import '../../../network_processor/network_main.dart';
import '../../repositoris/db_data_source/user.dart';
import '../../urils/isolate/base_msg.dart';
import '../../urils/isolate/msgs/login_user.dart';
import '../../urils/profilers/abstract.dart';
import 'isolates/network.dart';

class UserApiProfile extends ModChangeNotifier {
  final NetworkIsolateProfile networkPr;
  late UserDbDS? _user;

  late bool _firstUserInit;

  late ApiPackage? _baseApi;

  late Map<String, String> _authHeaders;

  late Future _awaitUser;

  Future<UserDbDS?> Function() get awaitUser => () async {
        await _awaitUser;
        return _user;
      };

  UserApiProfile({required this.networkPr}) : super() {
    // print("UserApiProfile");
    // init();
  }

  @override
  void init({bool isRealInit = false}) {
    parentProvidersList[networkPr.runtimeType] = networkPr;
    _user = null;
    _firstUserInit = true;
    _baseApi = null;
    _authHeaders = {};
    getUser();
    super.init(isRealInit: isRealInit);
  }

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
    if (this._user != user || _firstUserInit) {
      _firstUserInit = false;
      this._user = user;
      _awaitUser = (() async => this._user)();
      if (user != null) {
        networkProcessor(this);
      }

      notifyListeners();
    }
  }

  Future<void> userChange() async {
    var changedUser = _user;
    notifyListeners();
    if (changedUser != null) {
      var conn = await openConn();
      await conn.writeTxn(() async {
        await conn.collection<UserDbDS>().put(changedUser);
      });
      await closeConn();
    }
  }

  Future<UserDbDS?> getUser() async {
    _awaitUser = _getUser();
    return await _awaitUser;
  }

  Future<UserDbDS?> _getUser() async {
    if (_user != null && _user!.active) {
      return _user;
    } else {
      // await Future.delayed(Duration(seconds: 5));
      var conn = await openConn();
      var activeUsers = (await conn
          .collection<UserDbDS>()
          .filter()
          .activeEqualTo(true)
          .findAll());
      //2
      if (activeUsers.length > 1 || (_user != null && !(_user!.active))) {
        for (var u in activeUsers) {
          u.active = false;
        }
        if (_user != null) {
          activeUsers += [_user!, _user!];
        }
        (await conn.writeTxn(() async {
          (await conn.collection<UserDbDS>().putAll(activeUsers));
        }));
      }

      var coro = closeConn();

      UserDbDS? currentUser;
      if (activeUsers.isEmpty || activeUsers.length > 1) {
        currentUser = null;
      } else {
        currentUser = activeUsers[0];
      }
      await coro;
      _user = currentUser;
      notifyListeners();
      return _user;
    }
  }

  Future<void> loginUser(
      String username,
      String password,
      String? serverUrl,
      {Function(String?)? onErrorCallback}
      ) async {
    var res = await networkPr.sendToNetworkIsolateWithAnswer<
            LoginUserIsolateMsg, LoginUserAnsIsolateMsg>(
        LoginUserIsolateMsg(username, password, serverUrl),
        CrossIsolatesMessageType.userAndPassword,
        CrossIsolatesMessageType.loginUserAnsIsolateMsg
    );

    if (res.message.data) {
      var isar = await openConn();

      var query = isar
          .collection<UserDbDS>()
          .filter()
          .usernameEqualTo(username);

      var userStream = query.build().watch(fireImmediately: true);
      user = (await userStream.firstWhere((element) => element.isNotEmpty))[0];

      // await for (var usersList in userStream){
      //   for (var currUser in usersList){
      //     this.user = currUser;
      //     break;
      //   }
      //   if (this.user != null){
      //     break;
      //   }
      // }

      await closeConn();
    } else {
      if (onErrorCallback != null) {
        onErrorCallback(
            "На сервере пользователя с таким логином и паролем не найдено. Код ${res.message.statusCode}");
      }
    }
  }

  @override
  List<CollectionSchema<AbstractEntity>> get classes => [];

  @override
  void dispose() {
    super.dispose();
  }
}
