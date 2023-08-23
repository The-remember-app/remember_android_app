import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';
import 'package:the_remember/src/repositoris/db_data_source/user.dart';

import '../../../main.dart';
import '../../../network_processor/network_main.dart';
import '../../domain_layer/data_mixins/modules/modules.dart';
import '../../domain_layer/providers/user_api_provider.dart';
import '../../repositoris/db_data_source/folder.dart';
import '../../repositoris/db_data_source/http_utils.dart';
import '../../repositoris/db_data_source/module.dart';
import '../../repositoris/db_data_source/term.dart';
import '../../urils/db/abstract_entity.dart';
import '../../urils/db/dbMixins.dart';
import '../ui_states/home.dart';
import '../ui_templates/abstract_ui.dart';
import '../ui_templates/wrappers/on_init_wrapper.dart';
import 'login/LoginScreen.dart';
import 'modules/modules.dart';

// StatefulWidget имеет состояние, с которым
// позже мы будем работать через функцию
// setState(VoidCallback fn);
// обратите внимание setState принимает другую функцию



class AwaitUserScreen extends StatefulWidget {
  Future<UserDbDS?>? userGetter = null;
  bool userGetterCompleted = false;
  final Future Function(AwaitUserScreen, BuildContext) awaitUserFunc;

  AwaitUserScreen(this.awaitUserFunc) : super();

  @override
  _AwaitUserScreenState createState() => _AwaitUserScreenState();
}


class _AwaitUserScreenState extends AbstractUIStatefulWidget<AwaitUserScreen>
    with
        OpenAndClose3<CollectionSchema<UserDbDS>,
            CollectionSchema<HttpUtilsDbDS>, CollectionSchema<AbstractEntity>>,
        StartLoginingScreenDbMixin
    implements GetDataFromDbI {

  Future? get userGetter  => this.widget.userGetter;

  _AwaitUserScreenState(): super();

  @override
  Widget build(BuildContext context){
    // if (dbWorkCompleted && dbWorkCallback != null) {
    //   dbWorkCallback!(context);
    // }


    String? lastRoute = null;
    return
      Consumer<UserApiProfile>(builder: (context, userApi, child) {
        Future _future = widget.awaitUserFunc(widget, context);
      // Future _future = getUser(userApi);
      //   Future userGetter = UserApiProfile.getUser(userApi);
      return
        // StatefulOnInitWrapper(
        //   onInit: () {
        //     //FirebaseNotifications().setUpFirebase();
        //   },
        //   beforeBuild: (Widget , BuildContext ) {  },
        //   child:
          FutureBuilder<UserDbDS?>(
            future: _future.then((value) async {
              // var pr = Provider.of<UserApiProfile>(context, listen: false);
              var oldUser = userApi.user;
              userApi.user = value;
              // if (oldUser != value) {
              print(lastRoute ?? "no lastRoute");
                if (value == null && lastRoute != '/login_screen') {
                  print(11111111);
                  lastRoute = '/login_screen';
                  // await Navigator.pushNamed(
                  //   context,
                  //   '/login_screen',
                  //   arguments: Map<String, dynamic>(),
                  // );
                } else if (value != null && lastRoute != '/root_folder')  {
                  print(22222222);
                  lastRoute = '/root_folder';

                  // await Navigator.pushNamed(
                  //   context,
                  //   '/root_folder',
                  //   arguments: Map<String, dynamic>(),
                  // );
                }
              // }
              print(lastRoute ?? "no lastRoute");

              return value;
            }),
            builder: (context, AsyncSnapshot<UserDbDS?> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.error != null) {
                  return Text(snapshot.error.toString());
                }

                if (userApi.user != null) {
                  // Navigator.pushNamed(
                  //   context,
                  //   '/root_folder',
                  //   arguments: Map<String, dynamic>(),
                  // );
                  print(22222222444444444);
                  return StartModule();
                } else {
                  // Navigator.pushNamed(
                  //   context,
                  //   '/login_screen',
                  //   arguments: Map<String, dynamic>(),
                  // );
                  print(111111113333333333);
                  return LoginScreen();
                }
              } else {
                return Scaffold(
                  appBar: AppBar(),
                  body: Container(),
                );
              }
            },
          // )
        );
    });
  }
}

// return Scaffold(
//     // мы создаем AppBar с текстом "Home Page"
//     appBar: AppBar(title: Text("Home page")),
//     // указываем текст в качестве тела Scaffold
//     // текст предварительно вложен в Center виджет,
//     // чтобы выровнять его по центру
//     body: Center(
//         child: Text(
//       "Hello, JSON Placeholder!!!",
//       // Также выравниваем текст внутри самого виджета Text
//       textAlign: TextAlign.center,
//       // Theme.of(context) позволяет получить доступ к
//       // текущему ThemeData, который был указан в MaterialApp
//       // После получения ThemeData мы можем использовать
//       // различные его стили (например headline3, как здесь)
//       style: Theme.of(context).textTheme.headline3,
//     )));
//   }
// }
