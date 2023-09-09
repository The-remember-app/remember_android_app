import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:isar/isar.dart';
import 'package:quiver/iterables.dart';
import 'package:the_remember/src/repositoris/db_data_source/module.dart';

import '../../../main.dart';
import '../../../network_processor/network_main.dart';
import '../../repositoris/db_data_source/term.dart';
import '../../repositoris/db_data_source/term_adding_info.dart';
import '../../ui/ui_templates/pages/main/folders/module/learn/write_field_template.dart';
import '../../urils/db/dbMixins.dart';
import '../../urils/db/engine.dart';

// import '../providers/folders/module/terms_in_module.dart';
import '../providers/main/folders/module/learning/write/write_word_navigation.dart';
import '../providers/main/folders/module/terms_in_module.dart';
import '../providers/user_api_provider.dart';
// import 'package:quiver';

Future<void> startLearning(
    TermsInModuleProvider termPr, UserApiProfile userPr) async {
  await termPr.initLists;
  var currUpdateTime = DateTime.now();
  var min_ = 2;
  var max_ = termPr.termsList![0].module.value!.minWatchCount;
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

    await conn.collection<TermEntityDbDS>().putAll([
      for (var i in wordsInCurrModule)
        if (i != null) i
    ]);
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
  UserApiProfile userApi, {
  bool learnFinished = false,
}) async {
  var updateFuture = null;

  // for(var i in learnedData){
  //   i
  //    ;
  // }
  var currUpdateTime = DateTime.now();
  Map<int, TermEntityDbDS> currTermMap = {
    for (var i in learnedData) i.isarId: i..personalUpdatedAt = currUpdateTime
  };

  var currentModule = learnedData.isEmpty? null: learnedData[0]?.module.value;

  if (learnFinished) {
    currentModule!.isLearnt = true;
    updateFuture = Future.wait([
      updatePersonalizedTerms(currTermMap.values.toList(), userApi)
  ] + (learnFinished? [(() async { return null;})()]: []));
  } else {
    updateFuture = updatePersonalizedTerms(currTermMap.values.toList(), userApi);
  }

  // var networkFuture = updatePersonalizedTerms(termPr.termsList!, userPr);

  var conn =
      (await OpenAndClose3.openConnStatic([CollectionSchema<TermEntityDbDS>]))
          .values
          .toList()[0];

  var wordsInCurrModule =
      await conn.collection<TermEntityDbDS>().getAll(currTermMap.keys.toList());
  print(wordsInCurrModule);
  print(wordsInCurrModule.length);
  for (var w in wordsInCurrModule) {
    var updateTerm = currTermMap[w!.isarId]!;
    print("watchCount ${w.watchCount} ${updateTerm.watchCount}");
    print("chooseErrorCounter ${w.chooseErrorCounter} ${updateTerm.chooseErrorCounter}");
    print("writeErrorCounter ${w.writeErrorCounter} ${updateTerm.writeErrorCounter}");
    print("choiceNegErrorCounter ${w.choiceNegErrorCounter} ${updateTerm.choiceNegErrorCounter}");
    print("personalUpdatedAt ${w.personalUpdatedAt} ${updateTerm.personalUpdatedAt}");
    w
      ..chooseErrorCounter = updateTerm.chooseErrorCounter
      ..writeErrorCounter = updateTerm.writeErrorCounter
      ..choiceNegErrorCounter = updateTerm.choiceNegErrorCounter
      ..watchCount = updateTerm.watchCount
      ..personalUpdatedAt = updateTerm.personalUpdatedAt;
  }

  ModuleDbDS? currDbModule = null;
  if (learnFinished) {
    currDbModule = await conn.collection<ModuleDbDS>().getByComplexIndex(
        [currentModule!.uuid, currentModule.userUuid]);
    currDbModule!.isLearnt = true;
  }

  await conn.writeTxn(() async {
    // var wordsInCurrModule = await conn
    //     .collection<TermEntityDbDS>()
    //     .filter()
    //     .module((q) => q.isarIdEqualTo(moduleId))
    //     .findAll();

    await conn.collection<TermEntityDbDS>().putAll([
      for (var i in wordsInCurrModule)
        if (i != null) i
    ]);
    if (currDbModule != null && learnFinished) {
      await conn.collection<ModuleDbDS>().putByComplexIndex(currDbModule);
    }
  });

  var wordsInCurrModuleCheck =
  await conn.collection<TermEntityDbDS>().getAll(currTermMap.keys.toList());
  for (var w in wordsInCurrModuleCheck) {
    var updateTerm = currTermMap[w!.isarId]!;
    print("watchCount ${w.watchCount} ${updateTerm.watchCount}");
    print("chooseErrorCounter ${w.chooseErrorCounter} ${updateTerm
        .chooseErrorCounter}");
    print("writeErrorCounter ${w.writeErrorCounter} ${updateTerm
        .writeErrorCounter}");
    print("choiceNegErrorCounter ${w.choiceNegErrorCounter} ${updateTerm
        .choiceNegErrorCounter}");
    print("personalUpdatedAt ${w.personalUpdatedAt} ${updateTerm
        .personalUpdatedAt}");
  }

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
) {
  askedWord.watchCount += 1;
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
    termsPr.changedInLearningIterationTermsList!
        .addAll([askedWord, choiceWord]);
  }

}

void writeWordChanging(
  TermEntityDbDS askedWord,
  String? inputWord,
  List<TermEntityDbDS> allModuleTerms,
  TermsInModuleProvider termsPr,
) {
  if (inputWord == null ||
      askedWord.maybeReverseDefinitionWrite.toLowerCase() ==
          inputWord!.toLowerCase()) {
    askedWord.writeErrorCounter -= 1;
  } else {
    askedWord.writeErrorCounter += 1;
    if (askedWord.writeErrorCounter % 3 == 0) {
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
) {
  var definitionDataPre = termsList;
  definitionDataPre.shuffle();

  var definitionData = [
    for (var ww in definitionDataPre)
      if (ww.isarId != targetWordEntity.isarId &&
          (targetWordEntity.maybeReverseDefinitionChoice != ww.term &&
              targetWordEntity.maybeReverseDefinitionChoice != ww.definition))
        ww
  ];
  definitionData.sort((term1, term2) {
    return term2.watchCount.compareTo(term1.watchCount);
  });
  definitionData = definitionData.sublist(
      0, targetWordEntity.module.value!.choicesCount - 1);
  definitionData.add(targetWordEntity);
  definitionData.shuffle();
  return definitionData;
}

List<TermEntityDbDS> getOneLearnIterationList(
  List<TermEntityDbDS> termsList,
) {
  var currTermList = [
    for (var w in termsList)
      if ((w.writeErrorCounter > 0 || w.chooseErrorCounter > 0)) w
  ];
  if (currTermList.length == 0) {
    return currTermList;
  }

  int targetIterationLen = currTermList[0].module.value!.maxIterationLen;
  int knowTargetIterationLen = (targetIterationLen.toDouble() *
          currTermList[0].module.value!.knownTermPart.toDouble() /
          100.0)
      .round();
  int unknownTargetIterationLen = targetIterationLen - knowTargetIterationLen;

  var currLearntTermList = [
    for (var w in termsList)
      if ((w.writeErrorCounter <= 0 && w.chooseErrorCounter <= 0)) w
  ];

  int realUnknownIterationLen = targetIterationLen -
      min([currLearntTermList.length, knowTargetIterationLen])!;
  knowTargetIterationLen = targetIterationLen - realUnknownIterationLen;

  currTermList.sort((term1, term2) {
    if (term1.watchCount == 0) {
      return -1;
    } else if (term2.watchCount == 0) {
      return 1;
    }
    if (term1.chooseErrorCounter == term2.chooseErrorCounter) {
      return term2.writeErrorCounter.compareTo(term1.writeErrorCounter);
    }
    return term2.chooseErrorCounter.compareTo(term1.chooseErrorCounter);
  });
  if (currTermList.length >= realUnknownIterationLen) {
    currTermList = currTermList.sublist(0, realUnknownIterationLen);
  } else {
    // knowTargetIterationLen += ((realUnknownIterationLen - currTermList.length)).round();
    knowTargetIterationLen = (currTermList.length.toDouble() *
            currTermList[0].module.value!.knownTermPart.toDouble() /
            100.0)
        .round();
    knowTargetIterationLen = max([
      knowTargetIterationLen,
      currTermList[0].module.value!.minIterationLen - currTermList.length
    ])!;
    targetIterationLen = currTermList.length;
  }
  if (currLearntTermList.length >= knowTargetIterationLen) {
    currLearntTermList = currLearntTermList.sublist(0, knowTargetIterationLen);
  }

  for (var i in currLearntTermList) {
    var v = random.nextDouble() < 0.8;
    i
      ..chooseErrorCounter = v ? 1 : 0
      ..writeErrorCounter = v ? 0 : 1;
  }

  currTermList += currLearntTermList;
  currTermList.shuffle();

  return currTermList;
}

List<Widget> getOneWriteFieldInLearnProcess(
  TermAddingInfoDbDS? addTermInfo,
  TermEntityDbDS currentTerm,
  int fieldsCount,
  int currentFieldIndex,
  WriteWordNavigationProvider wwNavPr,
  List<GetTermSourceOrFormName> sourceOrFormNameWidgetList,
) {
  List<Widget> res = [];
  List<WriteWordRes> userInputsContainer = [];

  if (addTermInfo != null) {
    var helpPhrasesWithoutWordFirst = currentTerm.addInfoEntities
        .where((element) =>
                (element.addInfoType == AddInfoType.help_phrase_without_word &&
                    element.addingTextData == 'at_first')
            // && (fieldsCount == 1 ||
            // element.parentAddInfoUuid == addTermInfo!.uuid)
            )
        .map((e) => GetTextPart("(" + (e.textData ?? "???") + ")"))
        .toList();
    res += helpPhrasesWithoutWordFirst;

    var helpPhrasesWithWord = currentTerm.addInfoEntities
        .where((element) =>
            (element.addInfoType == AddInfoType.help_phrase_with_word)
            // && (fieldsCount == 1 ||
            // element.parentAddInfoUuid == addTermInfo!.uuid)
            &&
            ((("...".allMatches(element.addingTextData!).length == 1) &&
                    (currentTerm.addInfoEntities.every((element) =>
                        element.addInfoType != AddInfoType.composite_word))) ||
                (("...".allMatches(element.addingTextData!).length ==
                    currentTerm.addInfoEntities
                        .where((element) =>
                            element.addInfoType == AddInfoType.composite_word)
                        .length))))
        .toList();
    helpPhrasesWithWord.shuffle(random);
    if (helpPhrasesWithWord.isNotEmpty) {
      var str =
          (' ' + helpPhrasesWithWord[0].addingTextData! + ' ').split("...");
      if (str[0].trim().isNotEmpty) {
        res += [GetTextPart(str[0])];
        str.removeAt(0);
        str += [''];
      } else {
        str.removeAt(0);
        str += [''];
      }
      // if (currentTerm.addInfoEntities.any((element) => element.addInfoType == AddInfoType.composite_word))

      List<TermAddingInfoDbDS> termsList;
      if (currentTerm.addInfoEntities.any(
          (element) => element.addInfoType == AddInfoType.composite_word)) {
        termsList = currentTerm.addInfoEntities
            .where(
                (element) => element.addInfoType == AddInfoType.composite_word)
            .toList();
      } else {
        termsList = currentTerm.addInfoEntities
            .where((element) => ([
                  AddInfoType.usual_term,
                  AddInfoType.other_form,
                  AddInfoType.abbreviation,
                ].contains(element.addInfoType) &&
                element == addTermInfo))
            .toList();
      }

      for (var (index, data) in zip([str, termsList]).indexed) {
        var s = data[0] as String;
        var source = data[1] as LearnWriteEntity;
        res += [
          GetInputFieldPart(s, index, source, wwNavPr, userInputsContainer,
              fieldsCount, currentFieldIndex)
        ];
        if (s.trim().isNotEmpty) {
          res += [GetTextPart(s)];
        }
      }
    } else {
      res += [
        GetInputFieldPart(addTermInfo.textData!, 0, addTermInfo, wwNavPr,
            userInputsContainer, fieldsCount, currentFieldIndex)
      ];
    }

    var helpPhrasesWithoutWordEnd = currentTerm.addInfoEntities
        .where((element) =>
                (element.addInfoType == AddInfoType.help_phrase_without_word &&
                    (element.addingTextData == 'at_end' ||
                        element.addingTextData == 'any'))
            // &&   (fieldsCount == 1 ||
            // element.parentAddInfoUuid == addTermInfo!.uuid)
            )
        .map((e) => GetTextPart("(" + (e.textData ?? "???") + ")"))
        .toList();

    res += helpPhrasesWithoutWordEnd;
  } else {
    res += [
      GetInputFieldPart(currentTerm.maybeReverseDefinitionWrite, 0, currentTerm,
          wwNavPr, userInputsContainer, fieldsCount, currentFieldIndex)
    ];
  }

  var sourceOrFormName = sourceOrFormNameWidgetList.isEmpty
      ? ""
      : sourceOrFormNameWidgetList[0].text;
  var helpString = [for (var i in res) (i is GetTextPart) ? i.text : null];
  var stringKey =
      (sourceOrFormName ?? "") + [for (var i in helpString) i ?? '@@@'].join();
  var targetStrings = [
    for (var i in res)
      if (i is GetInputFieldPart) i.targetString
  ];
  var sourceEntity = [
    for (var i in res)
      if (i is GetInputFieldPart) i.currentLearnWriteEntity
  ];
  for (var (index, r)
      in res.where((element) => element is GetInputFieldPart).indexed) {
    if (r is GetInputFieldPart) {
      (r as GetInputFieldPart).realInit(
          stringKey, targetStrings, currentTerm, sourceEntity,
          oldUserInputsContainer: wwNavPr.results[stringKey]?.last ?? null);
    }
  }
  wwNavPr.results[stringKey] = ( wwNavPr.results[stringKey] ?? []);
  // for (var i in )
  wwNavPr.results[stringKey]!.add(null);

  return res;
}

List<Widget> getWriteFieldsListInLearnProcess(
  TermEntityDbDS currentTerm,
  List<TermEntityDbDS> termsList,
  WriteWordNavigationProvider wwNavPr,
) {

  for (var kv in wwNavPr.results.entries){
    for (var i in kv.value.where((element) => (element != null))){
      i!.clear();
    }
  }

  List<OneVariantTermField> widgetList = [];

  var similarTerms = termsList
      .where((element) =>
          // currentTerm.maybeReverseTermWriteSet.difference(
          //     currentTerm. isTermReverseWrite()?   element.definitionSet : element.termSet
          // ).isEmpty
          currentTerm.maybeReverseTermWriteSet ==
          (currentTerm.isTermReverseWrite()
              ? element.definitionSet
              : element.termSet))
      .toList();
  for (var i in [currentTerm] + similarTerms) {
    // i.addInfoEntities.
    var fields = i.addInfoEntities
        .toList()
        .where((element) => (element.addInfoType == AddInfoType.usual_term ||
            element.addInfoType == AddInfoType.other_form ||
            element.addInfoType == AddInfoType.abbreviation ||
            (element.addInfoType == AddInfoType.composite_word &&
                element.addingTextData == "1")))
        .toList();

    if (fields.isNotEmpty) {
      fields.sort((one, two) {
        if (one.addInfoType == AddInfoType.usual_term &&
            two.addInfoType != AddInfoType.usual_term) {
          return 1;
        } else if (one.addInfoType == AddInfoType.usual_term &&
            two.addInfoType == AddInfoType.usual_term) {
          return 0;
        } else {
          if (one.addInfoType == AddInfoType.abbreviation &&
              two.addInfoType != AddInfoType.abbreviation) {
            return 1;
          } else if (one.addInfoType == AddInfoType.abbreviation &&
              two.addInfoType == AddInfoType.abbreviation) {
            return 0;
          } else {
            if (one.addInfoType == AddInfoType.other_form &&
                two.addInfoType != AddInfoType.other_form) {
              return 1;
            } else if (one.addInfoType == AddInfoType.other_form &&
                two.addInfoType == AddInfoType.other_form) {
              if (one.addingTextData == 'infinitive') {
                return -1;
              } else if (one.addingTextData == 'v2') {
                if (two.addingTextData == 'infinitive') {
                  return 1;
                } else if (two.addingTextData == 'v2') {
                  return 0;
                } else {
                  return -1;
                }
              } else if (one.addingTextData == 'v3') {
                if (two.addingTextData == 'infinitive') {
                  return 1;
                } else if (two.addingTextData == 'v2') {
                  return 1;
                } else if (two.addingTextData == 'v3') {
                  return 0;
                } else {
                  return -1;
                }
              } else {
                return 1;
              }

              return 0;
            } else {
              if (one.addInfoType == AddInfoType.composite_word &&
                  two.addInfoType != AddInfoType.composite_word) {
                return 1;
              } else if (one.addInfoType == AddInfoType.composite_word &&
                  two.addInfoType == AddInfoType.composite_word) {
                return 0;
              } else {
                return -1;
              }
            }
          }
        }
      });

      if (wwNavPr.writtenWord != null) {
        fields = fields.where((element) {
          if ((wwNavPr.errorCountMap[element as LearnWriteEntity] ?? 0) > 0) {
            return true;
          }
          wwNavPr.disabledFields.add(element);
          return false;
        }).toList();
      }

      widgetList.addAll(fields
          .map<OneVariantTermField>(
              (e) => OneVariantTermField(e, i, currentTerm))
          .toList() as List<OneVariantTermField>);
    } else {
      if (wwNavPr.writtenWord == null ||
          (wwNavPr.writtenWord != null &&
              (wwNavPr.errorCountMap[currentTerm as LearnWriteEntity] ?? 0) >
                  0)) {
        widgetList.add(OneVariantTermField(null, i, currentTerm));
      } else {
        wwNavPr.disabledFields.add(currentTerm);
      }
    }
  }
  for (var (index, i) in widgetList.indexed) {
    i
      ..fieldsCount = widgetList.length
      ..currentFieldIndex = index;
  }

  return widgetList as List<Widget>;
}

bool testWrittenWord(
  String? sourceOrFormName,
  List<String?> helpString,
  TermEntityDbDS currentTerm,
  List<TermAddingInfoDbDS>? addTermInfo,
  WriteWordNavigationProvider wwNavPr,
) {
  var correctStringKey =
      (sourceOrFormName ?? "") + [for (var i in helpString) i ?? '@@@'].join();
  wwNavPr.checkCorrectingWordProcessor[correctStringKey] =
      (wwNavPr.checkCorrectingWordProcessor[correctStringKey] ?? []) + [];

  return true;
}

void userInputRegister(
  String userInput,
  String strKey,
  WriteWordNavigationProvider wwNavPr,
) {}

List<GetTermSourceOrFormName> sourceOrFormNameProcessor(
    TermAddingInfoDbDS? addTermInfo, TermEntityDbDS currentTerm) {
  bool sourceOrFormName;
  if (addTermInfo != null) {
    sourceOrFormName = (
        (addTermInfo!.addInfoType == AddInfoType.usual_term
            ||  addTermInfo!.addInfoType == AddInfoType.other_form)
            &&
            (addTermInfo!.addingTextData != null
                &&  addTermInfo!.addingTextData!.isNotEmpty)
    )
        || addTermInfo!.addInfoType == AddInfoType.abbreviation
    || addTermInfo.dialectOrArea != null
    ;
  } else {
    sourceOrFormName = false;
  }

  List<GetTermSourceOrFormName> sourceOrFormNameWidgetList = (sourceOrFormName
      ? <GetTermSourceOrFormName>[
          GetTermSourceOrFormName(addTermInfo!, currentTerm)
        ]
      : <GetTermSourceOrFormName>[]);
  return sourceOrFormNameWidgetList;
}
