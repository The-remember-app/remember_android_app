import 'dart:async';
import 'dart:collection';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:the_remember/src/repositoris/db_data_source/http_utils.dart';
import 'package:the_remember/src/repositoris/db_data_source/user.dart';
import 'package:the_remember/src/ui/pages/home.dart';
import 'package:the_remember/src/ui/pages/login/LoginScreen.dart';
import 'package:the_remember/src/ui/pages/modules/learning/choiceWord.dart';
import 'package:the_remember/src/ui/pages/modules/learning/learn_finished.dart';
import 'package:the_remember/src/ui/pages/modules/learning/writeWord.dart';
import 'package:the_remember/src/ui/pages/modules/learning/writeWordOneMoreTime.dart';
import 'package:the_remember/src/ui/pages/modules/unary_folder.dart';
import 'package:the_remember/src/ui/pages/modules/unary_module.dart';
import 'package:the_remember/src/ui/pages/settings/MyAccountScreen.dart';
import 'package:uuid/uuid.dart';
import 'package:path_provider/path_provider.dart';
import 'package:the_remember/src/repositoris/db_data_source/folder.dart';
import 'package:the_remember/src/repositoris/db_data_source/module.dart';
import 'package:the_remember/src/repositoris/db_data_source/term.dart';
import 'package:the_remember/src/ui/pages/modules/modules.dart';
import 'package:the_remember/src/urils/db/dbMixins.dart';
import 'package:the_remember/src/urils/db/engine.dart';
import 'package:provider/provider.dart';

import 'api_package/lib/api_package.dart';
import 'network_processor/network_main.dart';

// main() является главной функцией с которой начинается
// выполнение приложения
// возвращает виджет приложения
void main() async {
  // initDb().whenComplete(() => null);
  // networkProcessor().whenComplete(() => null);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserApiProfile()),
        // Provider(create: (context) => SomeOtherClass()),
      ],
      child: MyApp(),
    ),
  );
}

Future<UserDbDS?> getUser(UserApiProfile? userApi) async {
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
    // TODO: fix me
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
    networkProcessor(userApi);
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
      notifyListeners();
    }
  }
  void userChange(){
    notifyListeners();
  }
}

Random random = new Random();

// Future<void> initDb() async {
//   await Future.delayed(Duration(seconds: 5));
//   final dir = await getApplicationDocumentsDirectory();
//   final Map<String, String> wordsSet = {
//     "one": 'Один',
//     "two": "два",
//     "three": 'три',
//     "four": "Четыре",
//     "five": "Пять",
//     "six": "шесть",
//     "seven": "семь",
//   };
//
//   var conn = (await OpenAndClose3.openConnStatic([
//     CollectionSchema<FolderDbDS>,
//     CollectionSchema<ModuleDbDS>,
//     CollectionSchema<TermEntityDbDS>,
//   ]));
//
//   conn[ConnType.term]!.writeTxnSync(() {
//     var data = (conn[ConnType.term]!
//             .collection<FolderDbDS>()
//             .filter()
//             .rootFolderUuidIsNull())
//         .findAllSync();
//     var test = (conn[ConnType.term]!
//             .collection<FolderDbDS>()
//             .filter()
//             .rootFolderUuidIsNull())
//         .isEmptySync();
//
//     if (test) {
//       List<FolderDbDS> root_folders = [];
//       for (var i = 0; i < 2; i++) {
//         root_folders.add(FolderDbDS()
//           ..uuid = Uuid().v4()
//           ..name = 'Папка $i'
//           ..rootFolderUuid = null
//           ..rootFolder.value = null);
//       }
//       conn[ConnType.term]!.collection<FolderDbDS>().putAllSync(root_folders);
//
//       List<FolderDbDS> sub_folders = [];
//       var res = conn[ConnType.term]!
//           .collection<FolderDbDS>()
//           .filter()
//           .rootFolderIsNull()
//           .findAllSync();
//       for (var currRootFolder in root_folders) {
//         for (var i = 0; i < 2; i++) {
//           sub_folders.add(FolderDbDS()
//             ..uuid = Uuid().v4()
//             ..name = '${currRootFolder.name}_$i'
//             ..rootFolderUuid = currRootFolder.uuid
//             ..rootFolder.value = currRootFolder);
//         }
//       }
//
//       conn[ConnType.term]!.collection<FolderDbDS>().putAllSync(sub_folders);
//
//       List<ModuleDbDS> modules = [];
//       // var = ;
//       for (var currFolder in <FolderDbDS?>[null] + root_folders + sub_folders) {
//         modules.add(ModuleDbDS()
//           ..uuid = (Uuid()).v4()
//           ..name = 'Модуль из ${currFolder?.name ?? "корневой папки"}'
//           ..rootFolderUuid = currFolder?.uuid
//           ..rootFolder.value = currFolder
//           ..personalUpdatedAt = DateTime.now()
//           ..personalCreatedAt = DateTime.now());
//       }
//
//       conn[ConnType.term]!.collection<ModuleDbDS>().putAllSync(modules);
//
//       List<TermEntityDbDS> terms = [];
//       for (var currModule in modules) {
//         for (var keyValWord in wordsSet.entries) {
//           terms.add(TermEntityDbDS()
//             ..uuid = Uuid().v4()
//             ..term = keyValWord.key
//             ..definition = keyValWord.value
//             ..moduleUuid = currModule.uuid
//             ..chooseErrorCounter = 0
//             ..writeErrorCounter = 0
//             ..choisceNegErrorCounter = 0
//             ..module.value = currModule
//             ..personalUpdatedAt = DateTime.now()
//             ..personalCreatedAt = DateTime.now());
//         }
//       }
//
//       conn[ConnType.term]!.collection<TermEntityDbDS>().putAllSync(terms);
//     }
//     var res12 = conn[ConnType.term]!
//         .collection<FolderDbDS>()
//         .filter()
//         .rootFolderIsNull()
//         .findAllSync();
//     print(res12);
//   });
//   var res1 = conn[ConnType.term]!
//       .collection<FolderDbDS>()
//       .filter()
//       .rootFolderIsNull()
//       .findAllSync();
//   print(res1);
//   await OpenAndClose3.closeConnStatic(conn);
// }

// В Flutter все является виджетом (кнопки,списки, текст и т.д.)
// виджет - это отдельный компонент, который может быть отрисован
// на экране (не путать с Android виджетами)
// Наиболее простые виджеты наследуются от StatelessWidget класса
// и не имеют состояния
class MyApp extends StatelessWidget {
  // функция build отвечает за построение иерархии виджетов
  @override
  Widget build(BuildContext context) {
    // виджет MaterialApp - главный виджет приложения, который
    // позволяет настроить тему и использовать
    // Material Design для разработки.

    return
      // Consumer<UserApiProfile>(
      //   builder: (context, userApi, child)=>

      MaterialApp(
        // заголовок приложения
        // обычно виден, когда мы сворачиваем приложение
        title: 'Json Placeholder App',
        // настройка темы, мы ещё вернёмся к этому
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // указываем исходную страницу, которую мы создадим позже
        home: HomePage(),
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (context) {
            return StartModule();
          });
        },
        onGenerateRoute: (settings) {
          var args = settings.arguments as Map<String, dynamic>?;
          if (settings.name == '/root_folder') {
            return MaterialPageRoute(
              settings: settings,
              builder: (context) => StartModule(),
            );
          } else if (settings.name == '/module_id') {
            return MaterialPageRoute(
              settings: settings,
              builder: (context) =>
                  UnaryModule(args!["moduleId"] as ModuleDbDS),
            );
          } else if (settings.name == '/folders_id') {
            return MaterialPageRoute(
              settings: settings,
              builder: (context) => UnaryFolder(args!["folderId"] as int),
            );
          } else if (settings.name == '/learning__finished_modal') {
            // TODO: сделать окно окончания изучения слов модальным
            return MaterialPageRoute(
              settings: settings,
              builder: (context) =>
                  LearnCompleted(args!["moduleEntity"] as ModuleDbDS),
            );
          } else if (settings.name == '/learning__choice_word') {
            return MaterialPageRoute(
              settings: settings,
              builder: (context) => ChoiceWord(
                args!["moduleEntity"] as ModuleDbDS,
                args["wordEntity"] as TermEntityDbDS,
                args["progress"] as int,
                args["maxProgress"] as int,
                args["definitions"] as List<TermEntityDbDS>,
                args["currTermsList"] as List<TermEntityDbDS>?,
                args["reverseTerm"] as bool,
              ),
            );
          } else if (settings.name == '/learning__write_word') {
            return MaterialPageRoute(
              settings: settings,
              builder: (context) => WriteWord(
                args!["moduleEntity"] as ModuleDbDS,
                args["wordEntity"] as TermEntityDbDS,
                args["progress"] as int,
                args["maxProgress"] as int,
                args["currTermsList"] as List<TermEntityDbDS>?,
                args["reverseTerm"] as bool,
              ),
            );
          } else if (settings.name == '/learning__double_write_word') {
            return MaterialPageRoute(
              settings: settings,
              builder: (context) => WriteWordOneMoreTime(
                args!["moduleEntity"] as ModuleDbDS,
                args["wordEntity"] as TermEntityDbDS,
                args["progress"] as int,
                args["maxProgress"] as int,
                args["currTermsList"] as List<TermEntityDbDS>?,
                args["userInput"] as String,
                args["reverseTerm"] as bool,
              ),
            );
          } else if (settings.name == '/login_screen') {
            return MaterialPageRoute(
              settings: settings,
              builder: (context) => LoginScreen(),
            );
          } else if (settings.name == '/my_account') {
            return MaterialPageRoute(
              settings: settings,
              builder: (context) => MyAccountScreen(),
            );
          }
        });
      // );
  }
}
