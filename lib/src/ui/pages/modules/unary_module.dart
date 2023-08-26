///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../../../main.dart';
import '../../../domain_layer/data_mixins/modules/unary_module.dart';
import '../../../domain_layer/functions/words_BO.dart';
import '../../../domain_layer/providers/folder_module.dart';
import '../../../domain_layer/providers/module_buttoons_navigation.dart';
import '../../../domain_layer/providers/user_api_provider.dart';
import '../../../repositoris/db_data_source/folder.dart';
import '../../../repositoris/db_data_source/module.dart';
import '../../../repositoris/db_data_source/term.dart';
import '../../../urils/db/abstract_entity.dart';
import '../../../urils/db/dbMixins.dart';
import '../../ui_states/modules/unary_module.dart';
import '../../ui_templates/abstract_ui.dart';
import 'learning/choiceWord.dart';
import 'learning/learn_finished.dart';
import 'learning/writeWord.dart';
import 'learning/writeWordOneMoreTime.dart';
import 'modules.dart';

// Future<Widget>

Future<Function(BuildContext)> getNextLearnPage(
  ModuleDbDS moduleEntity, {
  List<TermEntityDbDS>? currTermList = null,
  int progress = -1,
  // List<int>? currTermIdList = null,
  String? InputedWord = null,
  bool? showPostScreen = null,
  BuildContext? context = null,
}) async {
  // return choiceWord;
  // if (currTermList == null){
  if (showPostScreen ?? false) {
    // return WriteWordOneMoreTime(moduleId, currentWord.id, progress, currTermList.length,);
  } else {
    progress += 1;
  }
  var currentModule = moduleEntity;

  // if (currTermList == null && currTermIdList != null) {
  //   currTermList ??= [for (var termId in currTermIdList) words[termId]!];
  // }
  if (currTermList == null) {
    currTermList ??= [
      for (var w in (await getAllTermsFromModule(moduleEntity.isarId)))
        if ((w.writeErrorCounter != 0 || w.chooseErrorCounter != 0)) w
    ];
    currTermList.sort((term1, term2) {
      if (term1.chooseErrorCounter == term2.chooseErrorCounter) {
        return term1.writeErrorCounter.compareTo(term2.writeErrorCounter);
      }
      return term1.chooseErrorCounter.compareTo(term2.chooseErrorCounter);
    });
    if (currTermList.length >= 10) {
      currTermList = currTermList.sublist(0, 10);
    }
    currTermList.shuffle();
  }

  if (currTermList.isEmpty) {
    var pr = Provider.of<UserApiProfile>(context!, listen: false);
    await learnTransactionCompleted(currTermList, pr);
    // return LearnCompleted(moduleEntity);
    return (BuildContext context) => Navigator.pushNamed(
          context,
          '/learning__finished_modal',
          arguments: {
            'moduleEntity': moduleEntity,
          },
        );
  }
  // if (progress >= currTermUuidList!.length){
  //   return UnaryModule() ;
  // }
  // }
  var lastWord = null;
  if (progress != 0) {
    lastWord = currTermList[progress - 1];
  }
  if (progress > 9 || progress >= currTermList.length) {
    if (InputedWord != null && lastWord != null) {
      if (InputedWord.toLowerCase() ==
          lastWord.maybeReverseDefinitionWrite.toLowerCase()) {
        lastWord.writeErrorCounter -= 1;
      } else {
        lastWord.writeErrorCounter += 1;
      }
      lastWord?.resetReverse();
    }
    var pr = Provider.of<UserApiProfile>(context!, listen: false);
    await learnTransactionCompleted(currTermList, pr);
    return (BuildContext context) => Navigator.pushNamed(
          context,
          '/module_id',
          arguments: {
            'moduleId': moduleEntity,
          },
        );
    // return UnaryModule(moduleEntity);
  }
  var currentWord = currTermList[progress];

  if (showPostScreen ?? false) {
    return (BuildContext context) => Navigator.pushNamed(
          context,
          '/learning__double_write_word',
          arguments: {
            'moduleEntity': moduleEntity,
            'wordEntity': currentWord,
            'progress': progress,
            'maxProgress': currTermList!.length,
            'currTermsList': currTermList,
            'userInput': InputedWord ?? "",
            'reverseTerm': currentWord.isTermReverseWrite(),
          },
        );
    // return WriteWordOneMoreTime(
    //     moduleEntity,
    //     currentWord,
    //     progress,
    //     currTermList.length,
    //     currTermList,
    //     InputedWord ?? "",
    //     currentWord.isTermReverseWrite());
  }
  if (InputedWord != null && lastWord != null) {
    if (InputedWord.toLowerCase() ==
        lastWord.maybeReverseDefinitionWrite.toLowerCase()) {
      lastWord.writeErrorCounter -= 1;
    } else {
      lastWord.writeErrorCounter += 1;
    }
    lastWord?.resetReverse();
  }
  if (currentWord.chooseErrorCounter == 0) {
    return (BuildContext context) => Navigator.pushNamed(
          context,
          '/learning__write_word',
          arguments: {
            'moduleEntity': moduleEntity,
            'wordEntity': currentWord,
            'progress': progress,
            'maxProgress': currTermList!.length,
            'currTermsList': currTermList,
            'reverseTerm': currentWord.isTermReverseWrite(),
          },
        );

    // return WriteWord(moduleEntity, currentWord, progress, currTermList.length,
    //     currTermList, currentWord.isTermReverseWrite());
  } else {
    var definitionDataPre = await getAllTermsFromModule(moduleEntity.isarId);
    definitionDataPre.shuffle();

    var definitionData = [
      for (var ww in definitionDataPre)
        if (ww.isarId != currentWord.isarId) ww
    ];
    definitionData = definitionData.sublist(0, 3);
    definitionData.add(currentWord);
    definitionData.shuffle();
    // var r_num =
    return (BuildContext context) => Navigator.pushNamed(
          context,
          '/learning__choice_word',
          arguments: {
            'moduleEntity': moduleEntity,
            'wordEntity': currentWord,
            'progress': progress,
            'maxProgress': currTermList!.length,
            'definitions': definitionData,
            'currTermsList': currTermList,
            'reverseTerm': currentWord.isTermReverseWrite(),
          },
        );
    // return ChoiceWord(moduleEntity, currentWord, progress, currTermList.length,
    //     definitionData, currTermList, currentWord.isTermReverseChoice());
  }
}

class UnaryModule extends StatefulWidget {
  UnaryModule();

  @override
  _UnaryModuleState createState() => _UnaryModuleState();
}

class _UnaryModuleState extends AbstractUIStatefulWidget<UnaryModule> {
  // late ModuleDbDS currentModuleEntity;
  // bool _flag = true;

  _UnaryModuleState() : super();

  @override
  Widget build(BuildContext context) {
    var fmPr = Provider.of<FolderAndModuleProvider>(context, listen: false);
    var moduleNavPr =
        Provider.of<ModuleButtonNavigationProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Color(0x1ff8f8f8),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.zero,
              border: Border.all(color: Color(0x4d9e9e9e), width: 0),
            ),
            child: Container(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              width: 200,
              height: 100,
              decoration: BoxDecoration(
                color: Color(0xffeccfff),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: Color(0xffe9c7ff), width: 1),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Term",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontSize: 24,
                    color: Color(0xffe83a3a),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
            child: MaterialButton(
              onPressed: () {
                // setState(() => _flag = !_flag);
              },
              color: Color(0xfffafafa),
              // elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: BorderSide(color: Color(0xff3a57e8), width: 1),
              ),
              padding: EdgeInsets.all(16),
              child: Text(
                'Карточки',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ),
              textColor: Color(0xff000000),
              height: 40,
              minWidth: 140,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
            child: MaterialButton(
              onPressed: () async {
                moduleNavPr.buttonType = ModuleButtonNavigationEnum.startLearn;
              },
              color: Color(0xfffafafa),
              // elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: BorderSide(color: Color(0xff3a57e8), width: 1),
              ),
              padding: EdgeInsets.all(16),
              child: Text(
                "Запустить режим заучивания заново",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ),
              textColor: Color(0xff000000),
              height: 40,
              minWidth: 140,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
            child: MaterialButton(
              onPressed: () async {
                moduleNavPr.buttonType = ModuleButtonNavigationEnum.continueLearn;
              },
              color: Color(0xfffafafa),
              // elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: BorderSide(color: Color(0xff3a57e8), width: 1),
              ),
              padding: EdgeInsets.all(16),
              child: Text(
                "Продолжить заучивание",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ),
              textColor: Color(0xff000000),
              height: 40,
              minWidth: 140,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
            child: MaterialButton(
              onPressed: () {
                moduleNavPr.buttonType = ModuleButtonNavigationEnum.moduleSettings;
              },
              color: Color(0xfffafafa),
              // elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: BorderSide(color: Color(0xff3a57e8), width: 1),
              ),
              padding: EdgeInsets.all(16),
              child: Text(
                "Настройки заучивания",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ),
              textColor: Color(0xff000000),
              height: 40,
              minWidth: 140,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
            child: MaterialButton(
              onPressed: () {},
              color: Color(0xfffafafa),
              // elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: BorderSide(color: Color(0xff3a57e8), width: 1),
              ),
              padding: EdgeInsets.all(16),
              child: Text(
                "Тест",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ),
              textColor: Color(0xff000000),
              height: 40,
              minWidth: 140,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

// Future<void> saveInDatabase(activity) async {
//   final isar = await IzarManager.instance.openActivityDB();
//
//   // await isar.writeTxn((isar) async {
//   //   await isar.activities.put(activity); // insert & update
//   // });
//   await IzarManager.instance.closeIsar(isar);
// }
}
