import 'package:isar/isar.dart';
import 'package:the_remember/repositoris/module_repository/local_db_data_source/module.dart';
import 'package:the_remember/repositoris/term_repository/local_db_data_source/term.dart';

import '../../repositoris/folder_repository/local_db_data_source/folder.dart';
import '../../urils/db/dbMixins.dart';
import '../../urils/db/engine.dart';

Future<void> startLearning(int moduleId) async {
  var conn =
      (await OpenAndClose3.openConnStatic([CollectionSchema<TermEntityDbDS>]))
          .values
          .toList()[0];
  var wordsInCurrModule = await conn
      .collection<TermEntityDbDS>()
      .filter()
      .module((q) => q.idEqualTo(moduleId))
      .findAll();

  await conn.writeTxn(() async {
    var wordsInCurrModule = await conn
        .collection<TermEntityDbDS>()
        .filter()
        .module((q) => q.idEqualTo(moduleId))
        .findAll();
    for (var w in wordsInCurrModule) {
      w.choose_error_counter = 1;
      w.write_error_counter = 1;
      w.choise_neg_error_counter = 0;
    }
    await conn.collection<TermEntityDbDS>().putAll(wordsInCurrModule);
  });
  var wordsInCurrModule1 = await conn
      .collection<TermEntityDbDS>()
      .filter()
      .module((q) => q.idEqualTo(moduleId))
      .findAll();
  await OpenAndClose3.closeConnStatic({ConnType.term: conn});
  // .putByIndex(indexName, object);
  // .where().

  // .
  //     .put(object)
}

Future<List<TermEntityDbDS>> getAllTermsFromModule(int moduleId) async {
  var conn =
      (await OpenAndClose3.openConnStatic([CollectionSchema<TermEntityDbDS>]))
          .values
          .toList()[0];
  var wordsInCurrModule = await conn
      .collection<TermEntityDbDS>()
      .filter()
      .module((q) => q.idEqualTo(moduleId))
      .findAll();
  await OpenAndClose3.closeConnStatic({ConnType.term: conn});
  return wordsInCurrModule;
}

Future<void> learnTransactionCompleted(List<TermEntityDbDS> learnedData) async {
  var conn =
      (await OpenAndClose3.openConnStatic([CollectionSchema<TermEntityDbDS>]))
          .values
          .toList()[0];
  await conn.writeTxn(() async {
    await conn.collection<TermEntityDbDS>().putAll(learnedData);
  });

  await OpenAndClose3.closeConnStatic({ConnType.term: conn});
}
