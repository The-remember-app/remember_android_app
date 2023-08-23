import 'package:isar/isar.dart';
import 'package:the_remember/src/repositoris/db_data_source/module.dart';


import '../../../main.dart';
import '../../../network_processor/network_main.dart';
import '../../repositoris/db_data_source/folder.dart';
import '../../repositoris/db_data_source/term.dart';
import '../../urils/db/dbMixins.dart';
import '../../urils/db/engine.dart';
import '../providers/user_api_provider.dart';

Future<void> startLearning(int moduleId) async {
  var conn =
      (await OpenAndClose3.openConnStatic([CollectionSchema<TermEntityDbDS>]))
          .values
          .toList()[0];
  var wordsInCurrModule = await conn
      .collection<TermEntityDbDS>()
      .filter()
      .module((q) => q.isarIdEqualTo(moduleId))
      .findAll();

  await conn.writeTxn(() async {
    var wordsInCurrModule = await conn
        .collection<TermEntityDbDS>()
        .filter()
        .module((q) => q.isarIdEqualTo(moduleId))
        .findAll();
    for (var w in wordsInCurrModule) {
      w.chooseErrorCounter = 1;
      w.writeErrorCounter = 1;
      w.choiceNegErrorCounter = 0;
    }
    await conn.collection<TermEntityDbDS>().putAll(wordsInCurrModule);
  });
  var wordsInCurrModule1 = await conn
      .collection<TermEntityDbDS>()
      .filter()
      .module((q) => q.isarIdEqualTo(moduleId))
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
      .module((q) => q.isarIdEqualTo(moduleId))
      .findAll();
  await OpenAndClose3.closeConnStatic({ConnType.term: conn});
  return wordsInCurrModule;
}

Future<void> learnTransactionCompleted(List<TermEntityDbDS> learnedData, UserApiProfile userApi) async {
  if (learnedData.isNotEmpty) {
    await updatePersonalizedTerms(learnedData, userApi);
  }
  var conn =
      (await OpenAndClose3.openConnStatic([CollectionSchema<TermEntityDbDS>]))
          .values
          .toList()[0];
  await conn.writeTxn(() async {
    await conn.collection<TermEntityDbDS>().putAll(learnedData);
  });

  await OpenAndClose3.closeConnStatic({ConnType.term: conn});
}
