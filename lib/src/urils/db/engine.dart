import 'dart:async';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:the_remember/src/repositoris/db_data_source/term_adding_info.dart';
import 'package:the_remember/src/repositoris/db_data_source/user.dart';

import '../../repositoris/db_data_source/folder.dart';
import '../../repositoris/db_data_source/http_utils.dart';
import '../../repositoris/db_data_source/module.dart';
import '../../repositoris/db_data_source/term.dart';

enum ConnType {
  module, folder, term, user, server_urls, term_info
}

class IzarManager  {
  static final IzarManager  instance  = IzarManager ._internal();
  final Map<String, int> _izarCounter = <String, int>{};

  factory IzarManager () {
    return instance ;
  }

  IzarManager._internal();

  Future<Isar> _openIsar<T>(String name, List<CollectionSchema<T>> schemes) async {
    final dir = await getApplicationDocumentsDirectory();
    final izar = Isar.getInstance(name);

    if (izar != null && izar.isOpen) {
      final count = _izarCounter[name] ?? 1;
      _izarCounter[name] = count + 1;
      return izar;
    }

    _izarCounter[name] = 1;

    return Isar.open(
      schemes,
      directory: dir.path,
      name: name,
      inspector: true,
    );
  }

  Future<void> closeIsar<T>(Isar izar) async {
    if (!izar.isOpen) {
      _izarCounter.remove(izar.name);
      return;
    }

    var count = _izarCounter[izar.name] ?? 1;
    count -= 1;
    _izarCounter[izar.name] = count;
    if (count > 0) return;

    await izar.close();
  }

  Future<Isar> openActivityDB(ConnType connName) async {
    // return switch(connName){
    //   ConnType.module => _openIsar('module', [TermEntityDbDSSchema, ModuleDbDSSchema, FolderDbDSSchema]),
    //   ConnType.term => _openIsar('term', [TermEntityDbDSSchema, ModuleDbDSSchema, FolderDbDSSchema]),
    //   ConnType.folder => _openIsar('folder', [TermEntityDbDSSchema, ModuleDbDSSchema, FolderDbDSSchema] ),
    // };
    return _openIsar('term',
        [TermEntityDbDSSchema,
          ModuleDbDSSchema,
          FolderDbDSSchema,
          UserDbDSSchema,
          HttpUtilsDbDSSchema,
          TermAddingInfoDbDSSchema
        ]);


  }

  // Future<void> saveInDatabase(activity) async {
  //   final isar = await IzarManager.instance.
  //
  //   await isar.writeTxn((isar) async {
  //     await isar.activities.put(activity); // insert & update
  //   });
  //   await IzarManager.instance.closeIsar(isar);
  // }

}