import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_remember/src/repositoris/db_data_source/user.dart';

import '../../domain_layer/providers/user_api_provider.dart';
import '../ui_templates/abstract_ui.dart';
import 'login_or_main_screen.dart';

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


class _AwaitUserScreenState extends AbstractUIStatefulWidget<AwaitUserScreen>{

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
      return FutureBuilder<UserDbDS?>(
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
                return LoginOrMainScreen(snapshot);

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
