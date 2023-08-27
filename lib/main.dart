import 'dart:math';

import 'package:flutter/material.dart';
import 'package:the_remember/src/ui/ui_states/navigation_processor.dart';

// main() является главной функцией с которой начинается
// выполнение приложения
// возвращает виджет приложения
void main() async {
  // initDb().whenComplete(() => null);
  // networkProcessor().whenComplete(() => null);

  // Future<int> testF() async{
  //   await Future.delayed(Duration(seconds: 5));
  //   return 5;
  // }
  // var resFuture = testF();
  // var res1 = await resFuture;
  // var res2 = await resFuture;
  // print(res1);
  // print(res2);

  runApp( MyApp() );
}

Random random = new Random();


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
        home: NavigationProcessor(),
        onUnknownRoute: (settings) {
          // return MaterialPageRoute(builder: (context) {
          //   return StartModule();
          // });
        },
        onGenerateRoute: (settings) {
          // var args = settings.arguments as Map<String, dynamic>?;
          // if (settings.name == '/root_folder') {
          //   return MaterialPageRoute(
          //     settings: settings,
          //     builder: (context) => StartModule(),
          //   );
          // } else if (settings.name == '/module_id') {
          //   return MaterialPageRoute(
          //     settings: settings,
          //     builder: (context) =>
          //         UnaryModule(args!["moduleId"] as ModuleDbDS),
          //   );
          // } else if (settings.name == '/folders_id') {
          //   return MaterialPageRoute(
          //     settings: settings,
          //     builder: (context) => UnaryFolder(args!["folderId"] as int),
          //   );
          // } else if (settings.name == '/learning__finished_modal') {
          //   // TODO: сделать окно окончания изучения слов модальным
          //   return MaterialPageRoute(
          //     settings: settings,
          //     builder: (context) =>
          //         LearnCompleted(args!["moduleEntity"] as ModuleDbDS),
          //   );
          // } else if (settings.name == '/learning__choice_word') {
          //   return MaterialPageRoute(
          //     settings: settings,
          //     builder: (context) => ChoiceWord(
          //       args!["moduleEntity"] as ModuleDbDS,
          //       args["wordEntity"] as TermEntityDbDS,
          //       args["progress"] as int,
          //       args["maxProgress"] as int,
          //       args["definitions"] as List<TermEntityDbDS>,
          //       args["currTermsList"] as List<TermEntityDbDS>?,
          //       args["reverseTerm"] as bool,
          //     ),
          //   );
          // } else if (settings.name == '/learning__write_word') {
          //   return MaterialPageRoute(
          //     settings: settings,
          //     builder: (context) => WriteWord(
          //       args!["moduleEntity"] as ModuleDbDS,
          //       args["wordEntity"] as TermEntityDbDS,
          //       args["progress"] as int,
          //       args["maxProgress"] as int,
          //       args["currTermsList"] as List<TermEntityDbDS>?,
          //       args["reverseTerm"] as bool,
          //     ),
          //   );
          // } else if (settings.name == '/learning__double_write_word') {
          //   return MaterialPageRoute(
          //     settings: settings,
          //     builder: (context) => WriteWordOneMoreTime(
          //       args!["moduleEntity"] as ModuleDbDS,
          //       args["wordEntity"] as TermEntityDbDS,
          //       args["progress"] as int,
          //       args["maxProgress"] as int,
          //       args["currTermsList"] as List<TermEntityDbDS>?,
          //       args["userInput"] as String,
          //       args["reverseTerm"] as bool,
          //     ),
          //   );
          // } else if (settings.name == '/login_screen') {
          //   return MaterialPageRoute(
          //     settings: settings,
          //     builder: (context) => AuthScreen(),
          //   );
          // } else if (settings.name == '/my_account') {
          //   return MaterialPageRoute(
          //     settings: settings,
          //     builder: (context) => MyAccountScreen(),
          //   );
          // }
        });
      // );
  }
}


