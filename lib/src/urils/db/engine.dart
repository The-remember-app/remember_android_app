import 'dart:async';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:the_remember/src/repositoris/db_data_source/sentence.dart';
import 'package:the_remember/src/repositoris/db_data_source/term_adding_info.dart';
import 'package:the_remember/src/repositoris/db_data_source/user.dart';
import 'package:the_remember/src/urils/db/abstract_entity.dart';

import '../../repositoris/db_data_source/folder.dart';
import '../../repositoris/db_data_source/http_utils.dart';
import '../../repositoris/db_data_source/module.dart';
import '../../repositoris/db_data_source/term.dart';

List<CollectionSchema<AbstractEntity>> allSchemes = [
  TermEntityDbDSSchema,
  ModuleDbDSSchema,
  FolderDbDSSchema,
  UserDbDSSchema,
  HttpUtilsDbDSSchema,
  TermAddingInfoDbDSSchema,
  SentenceDbDSSchema
];

enum ConnType { module, folder, term, user, server_urls, term_info }

class IzarManager {
  static final IzarManager instance = IzarManager._internal();
  final Map<String, int> _izarCounter = <String, int>{};
  Future<Isar>? currOpenOfConnection;

  factory IzarManager() {
    return instance;
  }

  IzarManager._internal();

  Future<Isar> _openIsar<T>(
      String name, List<CollectionSchema<T>> schemes) async {
    final izar = Isar.getInstance(name);

    if (izar != null && izar.isOpen) {
      final count = _izarCounter[name] ?? 1;
      _izarCounter[name] = count + 1;
      return izar;
    }

    if (_izarCounter[name] == null || _izarCounter[name] == 0) {
      _izarCounter[name] = 1;
    } else {
      _izarCounter[name] = (_izarCounter[name] ?? 0) + 1;
    }
    final dir = await getApplicationDocumentsDirectory();
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
    // Future<Isar> res;
    // if (currOpenOfConnection != null) {
    //   res = currOpenOfConnection!;
    // } else {
    //   currOpenOfConnection = _openIsar('term', allSchemes);
    //   res = currOpenOfConnection!;
    //   currOpenOfConnection!.then((value) {
    //     this.currOpenOfConnection = null;
    //     return value;
    //   });
    // }
    //
    // return res;
    return openActivityDBv2([]);
  }

  Future<Isar> openActivityDBv2(
      List<CollectionSchema<AbstractEntity>> connSchemes) async {
    Future<Isar> res;
    if (currOpenOfConnection != null) {
      res = currOpenOfConnection!;
    } else {
      currOpenOfConnection = _openIsar('term', allSchemes);
      res = currOpenOfConnection!;
      currOpenOfConnection!.then((value) {
        this.currOpenOfConnection = null;
        return value;
      });
    }

    return res;
  }
}
