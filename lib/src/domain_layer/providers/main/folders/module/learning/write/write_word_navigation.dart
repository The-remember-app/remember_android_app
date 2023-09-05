import 'dart:core';

// import 'package:the_remember/src/domain_layer/providers/folders/module/terms_in_module.dart';
import 'package:the_remember/src/repositoris/db_data_source/term.dart';

import '../../../../../../../urils/profilers/abstract.dart';
import '../../terms_in_module.dart';
import '../learning_navigation.dart';


class WriteWordRes {
  String userInput;
  final int indexInString;
  // final int fieldIndex;
  final String keyString;
  late Future<void> Function() errorCallback;


  WriteWordRes(this.userInput, this.indexInString, this.keyString,
      Future<void> Function()? errorCallback){
    if (errorCallback != null){
      this.errorCallback = errorCallback;
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
  late Map<TermEntityDbDS, Map<LearnWriteEntity, WriteWordRes> > resultsAsMap;
  late Map<String, Set<List<WriteWordRes>>> results;

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
      List<WriteWordRes> resultsContainer
  ) {
    checkCorrectingWordProcessor[strKey] =
        (checkCorrectingWordProcessor[strKey] ?? [])
          ..add( targetStrings);
    strTermsToEntities[strKey] =
        (strTermsToEntities[strKey] ?? [])
    ..add(currentTerm);
    strKeyToSourceEntity[strKey] =
        (strKeyToSourceEntity[strKey] ?? [])..add(sourceEntity);
    results[strKey] = (results[strKey] ?? Set())..add(resultsContainer);
  }

  void checkUserInput(){
    for (var kv in strKeyToSourceEntity.entries){
      var strKey = kv.key;
      var targetWords = [for (var i in kv.value) [for (var ii in i) ii.targetWrite]];
      var userInputs =  [for ( var i in results[strKey]!) [for(var ii in i) ii.userInput]];
      var targetWordsStrings = {for (var (index, i) in targetWords.indexed) (i.join("####"), index)};
      var userInputsStrings = {for (var (index, i) in userInputs.indexed) (i.join("####"), index)};
      if (targetWordsStrings.intersection( userInputsStrings) != targetWordsStrings){
        var correctTermsStr = targetWordsStrings.intersection( userInputsStrings);
        var errorTermsStr = userInputsStrings.intersection( targetWordsStrings);
        var correctTerms = [for (var (i, index) in correctTermsStr) targetWords[index]];
        var errorTerms =  [for (var (i, index) in errorTermsStr) userInputs[index]];

        var



      } else {
        // Всё правильно
      }
    }
  }


  void isUserCompletedInput(){

  }

}
