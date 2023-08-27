import 'dart:math';

import 'package:isar/isar.dart';
import 'package:the_remember/src/repositoris/db_data_source/module.dart';

import '../../../main.dart';
import '../../../network_processor/network_main.dart';
import '../../repositoris/db_data_source/term.dart';
import '../../urils/db/dbMixins.dart';
import '../../urils/db/engine.dart';
// import '../providers/folders/module/terms_in_module.dart';
import '../providers/main/folders/module/terms_in_module.dart';
import '../providers/user_api_provider.dart';

Future<void> startLearning(
    TermsInModuleProvider termPr, UserApiProfile userPr) async {
  await termPr.initLists;
  var currUpdateTime = DateTime.now();
  var min_ = 2;
  var max_ = 5;
  for (var w in termPr.termsList!) {

    var chooseCount = min_ + random.nextInt(max_ - min_);
    w.chooseErrorCounter = chooseCount;
    w.writeErrorCounter = max_ - chooseCount;
    w.choiceNegErrorCounter = 0;
    w.watchCount = 0;
    w.personalUpdatedAt = currUpdateTime;
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
    List<TermEntityDbDS> learnedData,
    UserApiProfile userApi
    ) async {
  var updateFuture = null;

  // for(var i in learnedData){
  //   i
  //    ;
  // }
  var currUpdateTime = DateTime.now();
  Map<int, TermEntityDbDS> currTermMap = {
    for (var i in learnedData) i.isarId: i
      ..personalUpdatedAt = currUpdateTime
  };

  if (learnedData.isNotEmpty) {
    updateFuture = updatePersonalizedTerms(currTermMap.values.toList(), userApi);
  }


  // var networkFuture = updatePersonalizedTerms(termPr.termsList!, userPr);


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

  await conn.writeTxn(() async {
    // var wordsInCurrModule = await conn
    //     .collection<TermEntityDbDS>()
    //     .filter()
    //     .module((q) => q.isarIdEqualTo(moduleId))
    //     .findAll();

    await conn.collection<TermEntityDbDS>()
        .putAll([
          for (var i in wordsInCurrModule)
            if (i != null) i
    ]);
  });

  // await conn.writeTxn(() async {
  //   await conn.collection<TermEntityDbDS>().putAll(learnedData);
  // });

  await OpenAndClose3.closeConnStatic({ConnType.term: conn});
  if (updateFuture != null) {
    await updateFuture!;
  }
}

void choiceWordChanging(
    TermEntityDbDS askedWord,
    TermEntityDbDS choiceWord,
    List<TermEntityDbDS> choiceList,
    TermsInModuleProvider termsPr,
    ){
  if (askedWord == choiceWord) {
    askedWord.chooseErrorCounter -= 1;

    termsPr.changedInLearningIterationTermsList!.add(askedWord);
  } else {
    askedWord.chooseErrorCounter += 1;
    if (choiceWord.watchCount > 0) {
      choiceWord.chooseErrorCounter += 1;
      choiceWord.watchCount += 1;
    }
    // choiceWord.choiceNegErrorCounter += 1;
    termsPr.changedInLearningIterationTermsList!.addAll([askedWord, choiceWord]);
  }
  askedWord.watchCount += 1;
}

void writeWordChanging(
TermEntityDbDS askedWord,
String? inputWord,
List<TermEntityDbDS> allModuleTerms,
TermsInModuleProvider termsPr,
){
  if (inputWord== null || askedWord.maybeReverseDefinitionWrite.toLowerCase() == inputWord!.toLowerCase()){
    askedWord.writeErrorCounter -= 1;
  } else {
    askedWord.writeErrorCounter += 1;
    if (askedWord.writeErrorCounter % 3 == 0){
      askedWord.chooseErrorCounter += 1;
    }
  }
  askedWord.watchCount += 1;
  termsPr.changedInLearningIterationTermsList!.add(askedWord);

}


List<TermEntityDbDS> getChoiceDefinitions(
TermEntityDbDS targetWordEntity,
bool reverseTerm,
List<TermEntityDbDS> termsList,
    ){
  var definitionDataPre = termsList;
  definitionDataPre.shuffle();

  var definitionData = [
    for (var ww in definitionDataPre)
      if (
      ww.isarId != targetWordEntity.isarId
          || targetWordEntity.maybeReverseDefinitionChoice != (
          reverseTerm ? ww.term : ww.definition
      )
      ) ww
  ];
  definitionData.sort((term1, term2) {
  return term2.watchCount.compareTo(term1.watchCount);
  });
  definitionData = definitionData.sublist(0, targetWordEntity.module.value!.choicesCount);
  definitionData.add(targetWordEntity);
  definitionData.shuffle();
  return definitionData;
}

List<TermEntityDbDS> getOneLearnIterationList(
    List<TermEntityDbDS> termsList,

    ){

  var targetIterationLen = 10;
  var unknownTargetIterationLen = 7;
  var knowTargetIterationLen = targetIterationLen - unknownTargetIterationLen;

  var currTermList = [
    for (var w in termsList)
      if ((w.writeErrorCounter != 0 || w.chooseErrorCounter != 0)) w
  ];

  var currLearntTermList = [
    for (var w in termsList)
      if ((w.writeErrorCounter == 0 && w.chooseErrorCounter == 0)) w
  ];

  int realUnknownIterationLen = targetIterationLen - min(currLearntTermList.length, knowTargetIterationLen);
  knowTargetIterationLen = targetIterationLen - realUnknownIterationLen;



  currTermList.sort((term1, term2) {
    if (term1.chooseErrorCounter == term2.chooseErrorCounter) {
      return term1.writeErrorCounter.compareTo(term2.writeErrorCounter);
    }
    return term1.chooseErrorCounter.compareTo(term2.chooseErrorCounter);
  });
  if (currTermList.length >= realUnknownIterationLen) {
    currTermList = currTermList.sublist(0, realUnknownIterationLen);
  } else {

    knowTargetIterationLen += ((currTermList.length - targetIterationLen) / 2).round();
    targetIterationLen = currTermList.length;
  }
  if (currLearntTermList.length >= knowTargetIterationLen){
    currLearntTermList = currLearntTermList.sublist(0, knowTargetIterationLen);
  }
  currTermList += currLearntTermList;
  currTermList.shuffle();

  return currTermList;
}