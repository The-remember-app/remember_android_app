import 'package:isar/isar.dart';
import 'package:the_remember/src/repositoris/db_data_source/module.dart';

import '../../../main.dart';
import '../../../network_processor/network_main.dart';
import '../../repositoris/db_data_source/folder.dart';
import '../../repositoris/db_data_source/term.dart';
import '../../urils/db/dbMixins.dart';
import '../../urils/db/engine.dart';
import '../providers/terms_in_module.dart';
import '../providers/user_api_provider.dart';

Future<void> startLearning(
    TermsInModuleProvider termPr, UserApiProfile userPr) async {
  await termPr.initLists;
  for (var w in termPr.termsList!) {
    w.chooseErrorCounter = 1;
    w.writeErrorCounter = 1;
    w.choiceNegErrorCounter = 0;
    w.personalUpdatedAt = DateTime.now();
  }
  Map<int, TermEntityDbDS> currTermMap = {
    for (var i in termPr.termsList!) i.isarId: i
  };
  var networkFuture = updatePersonalizedTerms(termPr.termsList!, userPr);

  var conn =
      (await OpenAndClose3.openConnStatic([CollectionSchema<TermEntityDbDS>]))
          .values
          .toList()[0];
  var wordsInCurrModule =
      await conn.collection<TermEntityDbDS>().getAll(currTermMap.keys.toList());
  for (var w in wordsInCurrModule) {
    var updateTerm = currTermMap[w!.isarId]!;
    w
      ..chooseErrorCounter = updateTerm.chooseErrorCounter
      ..writeErrorCounter = updateTerm.writeErrorCounter
      ..choiceNegErrorCounter = updateTerm.choiceNegErrorCounter
      ..personalUpdatedAt = updateTerm.personalUpdatedAt;
  }
  // var wordsInCurrModule = await conn
  //     .collection<TermEntityDbDS>()
  //     .filter()
  // .
  //     .module((q) => q.isarIdEqualTo(termPr.u))
  //     .findAll();

  await conn.writeTxn(() async {
    // var wordsInCurrModule = await conn
    //     .collection<TermEntityDbDS>()
    //     .filter()
    //     .module((q) => q.isarIdEqualTo(moduleId))
    //     .findAll();

    await conn.collection<TermEntityDbDS>().putAll([for (var i in wordsInCurrModule) if (i != null) i]);
  });
  // var wordsInCurrModule1 = await conn
  //     .collection<TermEntityDbDS>()
  //     .filter()
  //     .module((q) => q.isarIdEqualTo(moduleId))
  //     .findAll();
  await OpenAndClose3.closeConnStatic({ConnType.term: conn});
  // .putByIndex(indexName, object);
  // .where().

  // .
  //     .put(object)
  await networkFuture;
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

Future<void> learnTransactionCompleted(
    List<TermEntityDbDS> learnedData, UserApiProfile userApi) async {
  var updateFuture = null;
  if (learnedData.isNotEmpty) {
    updateFuture = updatePersonalizedTerms(learnedData, userApi);
  }
  var conn =
      (await OpenAndClose3.openConnStatic([CollectionSchema<TermEntityDbDS>]))
          .values
          .toList()[0];
  await conn.writeTxn(() async {
    await conn.collection<TermEntityDbDS>().putAll(learnedData);
  });

  await OpenAndClose3.closeConnStatic({ConnType.term: conn});
  if (updateFuture != null) {
    await updateFuture!;
  }
}
