import 'dart:core';

// import 'package:the_remember/src/domain_layer/providers/folders/module/terms_in_module.dart';
import 'package:flutter/cupertino.dart';
import 'package:quiver/collection.dart';
import 'package:the_remember/src/repositoris/db_data_source/term.dart';

import '../../../../../../../ui/ui_templates/abstract_ui.dart';
import '../../../../../../../urils/profilers/abstract.dart';
import '../../terms_in_module.dart';
import '../learning_navigation.dart';

class WriteWordRes {
  String userInput;
  final int indexInString;

  // final int fieldIndex;
  final String keyString;
  late Future<void> Function(BuildContext, AbstractUIStatefulWidget)
      errorCallback;
  late Future<void> Function(BuildContext, AbstractUIStatefulWidget)
      successCallback;

  WriteWordRes(
    this.userInput,
    this.indexInString,
    this.keyString,
    Future<void> Function(BuildContext, AbstractUIStatefulWidget)?
        errorCallback,
    Future<void> Function(BuildContext, AbstractUIStatefulWidget)?
        successCallback,
  ) {
    if (errorCallback != null) {
      this.errorCallback = errorCallback;
    }
    if (successCallback != null) {
      this.successCallback = successCallback;
    }
  }
}

// class ItemHashList extends List<String>{
//
// }

class WriteWordNavigationProvider extends ModChangeNotifier {
  late String? _writtenWord;

  TermEntityDbDS get _targetWord =>
      termsPr.learningIterationTermsList![learnNavPr.activePageNumber];
  final LearnScreensNavigationProvider learnNavPr;
  final TermsInModuleProvider termsPr;
  late Map<String, List<List<String>>> checkCorrectingWordProcessor;
  late Map<String, List<TermEntityDbDS>> strTermsToEntities;
  late Map<String, List<List<LearnWriteEntity>>> strKeyToSourceEntity;
  late Map<TermEntityDbDS, Map<LearnWriteEntity, WriteWordRes>> resultsAsMap;
  late Map<String, Set<List<WriteWordRes>>> results;
  late Map<LearnWriteEntity, int> errorCountMap;

  WriteWordNavigationProvider(this.termsPr, this.learnNavPr) : super() {}

  @override
  void init({bool isRealInit = false}) {
    parentProvidersList[learnNavPr.runtimeType] = learnNavPr;
    _writtenWord = null;
    checkCorrectingWordProcessor = Map();
    strTermsToEntities = Map();
    strKeyToSourceEntity = Map();
    resultsAsMap = Map();
    results = Map();
    errorCountMap = Map();

    super.init(isRealInit: isRealInit);
  }

  String? get writtenWord => _writtenWord;

  set writtenWord(String? value) {
    _writtenWord = value;
    // writeWordChanging(_targetWord, _writtenWord, termsPr.termsList!);
    notifyListeners();
  }

  TermEntityDbDS get targetWord => _targetWord;

  void addWriteWordProcessor(
      String strKey,
      List<String> targetStrings,
      TermEntityDbDS currentTerm,
      List<LearnWriteEntity> sourceEntity,
      List<WriteWordRes> resultsContainer) {
    checkCorrectingWordProcessor[strKey] =
        (checkCorrectingWordProcessor[strKey] ?? []);
    checkCorrectingWordProcessor[strKey]!.add(targetStrings);
    strTermsToEntities[strKey] = (strTermsToEntities[strKey] ?? []);
    strTermsToEntities[strKey]!.add(currentTerm);
    strKeyToSourceEntity[strKey] = (strKeyToSourceEntity[strKey] ?? []);
    strKeyToSourceEntity[strKey]!.add(sourceEntity);

    results[strKey] = (results[strKey] ?? Set());
    results[strKey]!.add(resultsContainer);
    // results[strKey]!.toList()
    print("");
  }

  Future<void> checkUserInput(
      BuildContext? context,
      AbstractUIStatefulWidget? setStateWidget,
      {bool isAnotherWrite = false,
      bool passedReInput = false,
      bool answerIsPreventiveCorrect = false}) async {
    int errorCount = 0;

    Map<TermEntityDbDS, int> termErrorCounter = {};

    for (var kv in strKeyToSourceEntity.entries) {
      var strKey = kv.key;
      var currentTerms = strTermsToEntities[strKey]!;

      for (var i in currentTerms) {
        termErrorCounter[i] = (termErrorCounter[i] ?? 0);
      }

      var targetWords = [
        for (var i in kv.value) [for (var ii in i) ii.targetWrite]
      ];
      var userInputs = [
        for (var i in results[strKey]!) [for (var ii in i) ii.userInput]
      ];
      var targetWordsStrings = {
        for (var (index, i) in targetWords.indexed) (i.join("####"), index)
      };
      var userInputsStrings = {
        for (var (index, i) in userInputs.indexed) (i.join("####"), index)
      };
      Set<(String, int)> correctTermsStr;
      Set<(String, int)> errorTermsStr;
      // setsEqual({1}, {1});
      if (setsEqual(targetWordsStrings.intersection(userInputsStrings),
          targetWordsStrings)) {
        correctTermsStr = targetWordsStrings;
        errorTermsStr = {};
      } else {
        correctTermsStr = targetWordsStrings.difference(userInputsStrings);
        errorTermsStr = userInputsStrings.difference(targetWordsStrings);
        var correctTerms = [
          for (var (i, index) in correctTermsStr) targetWords[index]
        ];
        var errorTerms = [
          for (var (i, index) in errorTermsStr) userInputs[index]
        ];
      }
      errorCount += errorTermsStr.length;
      for (var (errorStrField, index) in errorTermsStr) {
        var currTerm = strTermsToEntities[strKey]![index].termEntityInterface;
        // if (!isAnotherWrite) {
        //   currTerm.writeErrorCounter += 1;
        // }
        if (!isAnotherWrite) {
          termErrorCounter[currTerm] = (termErrorCounter[currTerm] ?? 0) + 1;
        }
        errorCountMap[strTermsToEntities[strKey]![index]] =
            (errorCountMap[strTermsToEntities[strKey]![index]] ?? 0) + 1;
      }

      for (var (successStrField, index) in correctTermsStr) {
        var currTerm = strTermsToEntities[strKey]![index].termEntityInterface;
        // if (!isAnotherWrite) {
        //   currTerm.writeErrorCounter += 1;
        // }
        if (!isAnotherWrite) {
          termErrorCounter[currTerm] = (termErrorCounter[currTerm] ?? 0);
        }
        errorCountMap[strTermsToEntities[strKey]![index]] =
            (errorCountMap[strTermsToEntities[strKey]![index]] ?? 0) + 1;
      }

      await Future.wait([
            for (var (i, index) in correctTermsStr)
              for (var ii in results[strKey]!)
                for (var iii in ii)
                  iii.successCallback(
                    context!, setStateWidget!
                  )
          ] +
          [
            for (var (i, index) in errorTermsStr)
              for (var ii in results[strKey]!)
                for (var iii in ii) iii.errorCallback(context!, setStateWidget!)
          ]);

      // var correct = [
      //   for (var i in targetWordsStrings.intersection( userInputsStrings))
      //
      // ];
    }

    if (isAnotherWrite || errorCount == 0 || passedReInput) {
      for (var kv in termErrorCounter.entries) {
        if (kv.value == 0 || answerIsPreventiveCorrect) {
          //TODO: баллы начислять только после окна с исправлением ошибок
          kv.key.writeErrorCounter -= 1;
        } else {
          kv.key.writeErrorCounter += 1;
          if (kv.key.writeErrorCounter % 3 == 2 &&
              kv.key.writeErrorCounter > 2) {
            kv.key.chooseErrorCounter += 1;
          }
        }
        termsPr.changedInLearningIterationTermsList!.add(kv.key);
      }
    }

    if (errorCount == 0 || passedReInput || answerIsPreventiveCorrect) {
      learnNavPr.activePageNumber += 1;
    } else {
      if (!isAnotherWrite) {
        writtenWord = "";
      }
    }
  }

  void isUserCompletedInput() {}
}
