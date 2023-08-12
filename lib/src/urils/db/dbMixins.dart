import 'package:isar/isar.dart';

import '../../repositoris/db_data_source/folder.dart';
import '../../repositoris/db_data_source/module.dart';
import '../../repositoris/db_data_source/term.dart';
import 'abstract_entity.dart';
import 'dbMixins.dart';
import 'engine.dart';

abstract class OpenAndCloseI{
  void openConn();
  void closeConn();

}

abstract class GetDataFromDbI{
  void completionData();
}


abstract mixin class OpenAndClose3<
T1 extends CollectionSchema<AbstractEntity>,
T2 extends CollectionSchema<AbstractEntity>,
T3 extends CollectionSchema<AbstractEntity>
>  {
  late Map<ConnType, Isar> conn = Map();
  int counter = 0;

  Future<void> openConn() async {
    // FIXME: Если кто-то сторонний откроет
    //  второй коннекшн одного и того же типа
    //  во время работы первого
    //  (стандартного коннекшена, который открыл сам класс),
    //  то не понятно что делать

    var classes = [T1, T2, T3];
    for (var kv in (await openConnStatic(classes)).entries){
      if (conn.containsKey(kv.key)){
        throw "Повторное откртие коннекшена в одном и том же классе";
      }
      conn[kv.key] = kv.value;
    }

  }

  void closeConn() async {
    await closeConnStatic(conn);
    conn.clear();
    // for(var kv in conn.entries){
    //   conn.remove(kv.key);
    // }


  }

  static Future<Map<ConnType, Isar>> openConnStatic(List<Type> classes) async {
    Map<ConnType, Isar> locConn = Map();


    var  ddd  = classes.map((cl) async {

      var currConnType = switch (cl) {
        const (CollectionSchema<FolderDbDS>) => ConnType.folder,
        const (CollectionSchema<ModuleDbDS>) => ConnType.module,
        const (CollectionSchema<TermEntityDbDS>) => ConnType.term,
        const (CollectionSchema<AbstractEntity>) => null,
        _ => throw 'this type is not in in switch construction!',
      };
      if (currConnType != null) {
        locConn[currConnType] =
        await IzarManager.instance.openActivityDB(currConnType);
        return  locConn[currConnType];
      }
      return null;

    });
    for(var v in ddd){
      await v;
    }
    return locConn;
  }

  static Future<void> closeConnStatic(Map<ConnType, Isar> conn) async {
    conn.entries.forEach((kv) async {
      final (key, unary_conn) = (kv.key, kv.value);
      await IzarManager.instance.closeIsar(unary_conn);
    });

  }
  

}

