
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:the_remember/repositoris/folder_repository/local_db_data_source/folder.dart';
import 'package:the_remember/repositoris/module_repository/local_db_data_source/module.dart';
import 'package:the_remember/repositoris/term_repository/local_db_data_source/term.dart';
import 'package:the_remember/ui/pages/modules/modules.dart';
import 'package:the_remember/urils/db/dbMixins.dart';
import 'package:the_remember/urils/db/engine.dart';
import 'package:uuid/uuid.dart';

// main() является главной функцией с которой начинается
// выполнение приложения
// возвращает виджет приложения
void main() => runApp(MyApp());

Random random = new Random();

Future<void> initDb() async {

  final Map<String, String> wordsSet = {
    "one": 'Один',
    "two": "два",
    "three": 'три',
    "four": "Четыре",
    "five": "Пять",
    "six": "шесть",
    "seven": "семь",
  };

  var conn = (await OpenAndClose3.openConnStatic(
      [  CollectionSchema<FolderDbDS>, CollectionSchema<ModuleDbDS>, CollectionSchema<TermEntityDbDS>,]));

  conn[ConnType.term]!.writeTxnSync(()  {
    var test = (conn[ConnType.term]!
            .collection<FolderDbDS>()
            .filter()
    .root_folder_uuidIsNull()
    // .root_folderIsNull()
    // .findAllSync()
            .root_folderIsNull()
            .foldersIsEmpty())
    .isEmptySync();

    if (test) {
      List<FolderDbDS> root_folders = [];
      for (var i = 0; i < 2; i++) {
        root_folders.add(FolderDbDS()
          ..uuid = Uuid().toString()
          ..name = 'Папка $i'
          ..root_folder_uuid = null);
      }
      conn[ConnType.term]!
          .collection<FolderDbDS>()
          .putAllSync(root_folders);

      List<FolderDbDS> sub_folders = [];
      var res = conn[ConnType.term]!.collection<FolderDbDS>().filter().root_folderIsNull().findAllSync();
      for (var currRootFolder in root_folders) {
        for (var i = 0; i < 2; i++) {
          sub_folders.add(FolderDbDS()
            ..uuid = Uuid().toString()
            ..name = '${currRootFolder.name}_$i'
            ..root_folder_uuid = currRootFolder.uuid
            ..root_folder.value = currRootFolder);
        }
      }

      conn[ConnType.term]!.collection<FolderDbDS>().putAllSync(sub_folders);

      List<ModuleDbDS> modules = [];
      // var = ;
      for (var currFolder in <FolderDbDS?>[null] + root_folders + sub_folders) {
        modules.add(ModuleDbDS()
          ..uuid = Uuid().toString()
          ..name = 'Модуль из ${currFolder?.name ?? "корневой папки"}'
          ..root_folder.value = currFolder);
      }

      conn[ConnType.term]!.collection<ModuleDbDS>().putAllSync(modules);

      List<TermEntityDbDS> terms = [];
      for (var currModule in modules) {
        for(var keyValWord in wordsSet.entries) {
          terms.add(TermEntityDbDS()
            ..uuid = Uuid().toString()
              ..term=keyValWord.key
              ..definition=keyValWord.value
              ..module_id=currModule.uuid
              ..choose_error_counter=0
              ..write_error_counter=0
              ..choise_neg_error_counter=0
              ..module.value = currModule
            );
        }
      }

      conn[ConnType.term]!.collection<TermEntityDbDS>().putAllSync(terms);



    }
    var res12 = conn[ConnType.term]!.collection<FolderDbDS>().filter().root_folderIsNull().findAllSync();
  print(res12);
  });
  var res1 = conn[ConnType.term]!.collection<FolderDbDS>().filter().root_folderIsNull().findAllSync();
  print(res1);
  await OpenAndClose3.closeConnStatic(conn);

}

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
    initDb().whenComplete(() {
      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //   content: Text("create DB"),
      // ));

      // Timer(Duration(seconds: 30), () {
      //   print("Yeah, this line is printed after 3 seconds");
      // });

    });
    return MaterialApp(
      // заголовок приложения
      // обычно виден, когда мы сворачиваем приложение
      title: 'Json Placeholder App',
      // настройка темы, мы ещё вернёмся к этому
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // указываем исходную страницу, которую мы создадим позже
      home: StartModule(),
    );
  }
}
