import 'dart:core';

// import 'package:the_remember/src/domain_layer/providers/folders/module/terms_in_module.dart';
import 'package:flutter/cupertino.dart';
import 'package:quiver/collection.dart';
import 'package:the_remember/src/repositoris/db_data_source/term.dart';

import '../../../../../../../ui/ui_templates/abstract_ui.dart';
import '../../../../../../../urils/profilers/abstract.dart';
import '../../../../../../../urils/sets.dart';
import '../../terms_in_module.dart';
import '../learning_navigation.dart';

class WriteWordRes {
  String userInput;
  final int indexInString;

  // final int fieldIndex;
  late String keyString;
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
  // late Map<TermEntityDbDS, Map<LearnWriteEntity, WriteWordRes>> resultsAsMap;
  late Map<String, List<List<WriteWordRes>?>> results;
  late Map<LearnWriteEntity, int> errorCountMap;
  late List<LearnWriteEntity> disabledFields;
  late Map<LearnWriteEntity, List<String>> learnWriteEntityToStrKey;

  WriteWordNavigationProvider(this.termsPr, this.learnNavPr) : super() {}

  @override
  void init({bool isRealInit = false}) {
    parentProvidersList[learnNavPr.runtimeType] = learnNavPr;
    _writtenWord = null;
    checkCorrectingWordProcessor = Map();
    strTermsToEntities = Map();
    strKeyToSourceEntity = Map();
    // resultsAsMap = Map();
    results = Map();
    errorCountMap = Map();
    disabledFields = [];
    learnWriteEntityToStrKey = {};

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
    for (var lvEntity in sourceEntity) {
      learnWriteEntityToStrKey[lvEntity] =
          (learnWriteEntityToStrKey[lvEntity] ?? []);
      learnWriteEntityToStrKey[lvEntity]!.add(strKey);

    }

    results[strKey] = (results[strKey] ?? []);
    if (results[strKey]!.isNotEmpty && results[strKey]!.last == null){
      results[strKey]![ results[strKey]!.length - 1] = resultsContainer;
    } else {
      results[strKey]!.add(resultsContainer);
    }
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

    for (var kv in strKeyToSourceEntity.entries.where((element) =>
        !(element.value.any((element1) =>
            element1.any((element2) => disabledFields.contains(element2)))))) {
      var strKey = kv.key;
      var currentTerms = strTermsToEntities[strKey]!;

      for (var i in currentTerms) {
        termErrorCounter[i] = (termErrorCounter[i] ?? 0);
        errorCountMap[i] = (errorCountMap[i] ?? 0);
      }
      for (var i in kv.value){
        for (var ii in i){
          errorCountMap[ii] = (errorCountMap[ii] ?? 0);
        }
      }

      var targetWords = [
        for (var i in kv.value) [for (var ii in i) ii.targetWrite]
      ];
      var userInputs = [
        for (var i in results[strKey]!.where((element) => (element != null)))
          [for (var ii in i!) ii.userInput]
      ];
      var _targetWordsStrings = [
        for (var (index, i) in targetWords.indexed) (i.join("####"), -1)
      ];
      var _userInputsStrings = [
        for (var (index, i) in userInputs.indexed) (i.join("####"), -1)
      ];
      var targetWordsStrings = {
        for (var (index, i) in _targetWordsStrings.indexed) i
      };
      var userInputsStrings = {
        for (var (index, i) in _userInputsStrings.indexed) i
      };

      Map<(String, int), int> targetWordsStringsCounter = {};
      Map<(String, int), int>  userInputsCounter = {};
      for (var i in _targetWordsStrings) {
        targetWordsStringsCounter[i] = (targetWordsStringsCounter[i] ?? 0) + 1;
      }
      for (var i in _userInputsStrings) {
        userInputsCounter[i] = (userInputsCounter[i] ?? 0) + 1;
      }




      Set<(String, int)> correctTermsStr;
      Set<(String, int)> errorTermsStr;
      // setsEqual({1}, {1});
      if (setsEqual(targetWordsStrings.intersection(userInputsStrings),
          targetWordsStrings)) {
        correctTermsStr = targetWordsStrings;
        errorTermsStr = {};
      } else {
        correctTermsStr = targetWordsStrings.intersection(userInputsStrings);
        errorTermsStr = mapCounterDifference(
            userInputsCounter,
            targetWordsStringsCounter
        ).keys.toSet();
        // errored
        // var correctTerms = [
        //   for (var (i, index) in correctTermsStr) targetWords[index]
        // ];
        // var errorTerms = [
        //   for (var (i, index) in errorTermsStr) userInputs[index]
        // ];
      }

      var targetWordsStringsOnly = {for (var i in correctTermsStr) i.$1};
      var targetWordsAsStrings = [ for (var i in strKeyToSourceEntity[strKey]!) for (var ii in i) ii];
      for (var learnWriteEntity in targetWordsAsStrings.where(
              (element) => targetWordsStringsOnly.contains((element.targetWrite))
      )){
        var currTerm = learnWriteEntity.termEntityInterface;
        // if (!isAnotherWrite) {
        //   currTerm.writeErrorCounter += 1;
        // }
        if (!answerIsPreventiveCorrect) {
          termErrorCounter[currTerm] = (termErrorCounter[currTerm] ?? 0);
        }
        errorCountMap[learnWriteEntity] =
        (errorCountMap[learnWriteEntity] ?? 0);
      }


      // for (var index = 0; index < correctTermsStr.length; index++) {
      //   var currTerm = strTermsToEntities[strKey]![0].termEntityInterface;
      //   // if (!isAnotherWrite) {
      //   //   currTerm.writeErrorCounter += 1;
      //   // }
      //   if (!answerIsPreventiveCorrect) {
      //     termErrorCounter[currTerm] = (termErrorCounter[currTerm] ?? 0);
      //   }
      //   errorCountMap[strTermsToEntities[strKey]![0]] =
      //   (errorCountMap[strTermsToEntities[strKey]![0]] ?? 0);
      // }


      errorCount += errorTermsStr.length;

      // var targetWordsErrorsOnly = {for (var i in targetWordsStrings) i.$1};
      for (var learnWriteEntity in targetWordsAsStrings.where(
              (element) => !targetWordsStringsOnly.contains((element.targetWrite))
      )){
      // for (var (errorStrField, index) in errorTermsStr) {
        var currTerm = learnWriteEntity.termEntityInterface;
        // if (!isAnotherWrite) {
        //   currTerm.writeErrorCounter += 1;
        // }
        if (!answerIsPreventiveCorrect) {
          termErrorCounter[currTerm] = (termErrorCounter[currTerm] ?? 0) + 1;
        }
        errorCountMap[learnWriteEntity] =
            (errorCountMap[learnWriteEntity] ?? 0) + 1;

        // for (var i in strKeyToSourceEntity[strKey]![0]) {
          if (currTerm != learnWriteEntity) {
            errorCountMap[learnWriteEntity] = (errorCountMap[learnWriteEntity] ?? 0) + 1;
          }
        // }
      }



      await Future.wait([
            for (var (i, index) in correctTermsStr)
              for (var ii
                  in results[strKey]!.where((element) => (element != null)))
                for (var iii in ii!)
                  iii.successCallback(context!, setStateWidget!)
          ] +
          [
            for (var (i, index) in errorTermsStr)
              for (var ii
                  in results[strKey]!.where((element) => (element != null)))
                for (var iii in ii!)
                  iii.errorCallback(context!, setStateWidget!)
          ]);

      // var correct = [
      //   for (var i in targetWordsStrings.intersection( userInputsStrings))
      //
      // ];
    }

    if (errorCount == 0 || passedReInput || answerIsPreventiveCorrect) {
      for (var kv in termErrorCounter.entries) {
        if (kv.value == 0 || answerIsPreventiveCorrect) {
          // TODO: баллы начислять только после окна с исправлением ошибок
          kv.key.writeErrorCounter -= 1;
        } else {
          kv.key.writeErrorCounter += 1;
          if (kv.key.writeErrorCounter % 3 == 2 &&
              kv.key.writeErrorCounter > 2) {
            kv.key.chooseErrorCounter += 1;
          }
        }
        kv.key.watchCount += 1;
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
