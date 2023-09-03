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

  WriteWordRes(this.userInput, this.indexInString, this.keyString);

}

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
        (checkCorrectingWordProcessor[strKey] ?? []) + [targetStrings];
    strTermsToEntities[strKey] =
        (strTermsToEntities[strKey] ?? []) + [currentTerm];
    strKeyToSourceEntity[strKey] =
        (strKeyToSourceEntity[strKey] ?? []) + [sourceEntity];
    results[strKey] = (results[strKey] ?? Set());
    results[strKey]!.add(resultsContainer);
  }

  void checkUserInput(){
    for (var kv in checkCorrectingWordProcessor.entries){
      var strKey = kv.key;
      var targetWords = kv.value.toSet();
      var userInputs =  results[strKey];
      if (targetWords.intersection( userInputs) != targetWords){

      }
    }
  }

}
