///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:the_remember/repositoris/db_data_source/term.dart';
import 'package:uuid/uuid.dart';

import '../../../domain_layer/data_mixins/modules/unary_module.dart';
import '../../../domain_layer/functions/words_BO.dart';
import '../../../repositoris/db_data_source/folder.dart';
import '../../../repositoris/db_data_source/module.dart';
import '../../../urils/db/abstract_entity.dart';
import '../../../urils/db/dbMixins.dart';
import '../../ui_states/modules/unary_module.dart';
import '../../ui_templates/abstract_ui.dart';
import 'learning/choiceWord.dart';
import 'learning/learn_finished.dart';
import 'learning/writeWord.dart';
import 'learning/writeWordOneMoreTime.dart';
import 'modules.dart';

Future<Widget> getNextLearnPage(
    ModuleDbDS moduleEntity, [
  List<TermEntityDbDS>? currTermList = null,
  int progress = -1,
  // List<int>? currTermIdList = null,
  String? InputedWord = null,
  bool? showPostScreen = null,
]) async {
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
      for (var w in (await getAllTermsFromModule(moduleEntity.id)))
        if (
            (w.write_error_counter != 0 || w.choose_error_counter != 0))
          w
    ];
    currTermList.sort((term1, term2) {
      if (term1.choose_error_counter == term2.choose_error_counter) {
        return term1.write_error_counter.compareTo(term2.write_error_counter);
      }
      return term1.choose_error_counter.compareTo(term2.choose_error_counter);
    });
    if (currTermList.length >= 10) {
      currTermList = currTermList.sublist(0, 10);
    }
    currTermList.shuffle();
  }

  if (currTermList.isEmpty) {
    await learnTransactionCompleted(currTermList);
    return LearnCompleted(moduleEntity);
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
      if (InputedWord.toLowerCase() == lastWord.maybeReverseDefinitionWrite.toLowerCase()) {
        lastWord.write_error_counter -= 1;
      } else {
        lastWord.write_error_counter += 1;
      }
      lastWord?.resetReverse();
    }
    await learnTransactionCompleted(currTermList);
    return UnaryModule(moduleEntity);
  }
  var currentWord = currTermList[progress];

  if (showPostScreen ?? false) {
    return WriteWordOneMoreTime(
        moduleEntity,
        currentWord,
        progress,
        currTermList.length,
        currTermList,
        InputedWord ?? "",
        currentWord.isTermReverseWrite());
  }
  if (InputedWord != null && lastWord != null) {
    if (InputedWord.toLowerCase() == lastWord.maybeReverseDefinitionWrite.toLowerCase()) {
      lastWord.write_error_counter -= 1;
    } else {
      lastWord.write_error_counter += 1;
    }
    lastWord?.resetReverse();
  }
  if (currentWord.choose_error_counter == 0) {
    return WriteWord(
        moduleEntity,
        currentWord,
        progress,
        currTermList.length,
        currTermList,
        currentWord.isTermReverseWrite()
    );
  } else {
    var definitionDataPre = await getAllTermsFromModule(moduleEntity.id);
    definitionDataPre.shuffle();

    var definitionData = [
      for (var ww in definitionDataPre)
        if (ww.id != currentWord.id) ww
    ];
    definitionData = definitionData.sublist(0, 3);
    definitionData.add(currentWord);
    definitionData.shuffle();
    // var r_num =
    return ChoiceWord(
        moduleEntity,
        currentWord,
        progress,
        currTermList.length,
        definitionData,
        currTermList,
        currentWord.isTermReverseChoice()
    );
  }
}

class UnaryModule extends StatefulWidget {
  final ModuleDbDS moduleId;

  UnaryModule(this.moduleId);

  @override
  _UnaryModuleState createState() => _UnaryModuleState(moduleId);
}

class _UnaryModuleState
    extends AbstractUIStatefulWidget<UnaryModule>

    with OpenAndClose3<
        CollectionSchema<TermEntityDbDS>,
        CollectionSchema<ModuleDbDS>,
        CollectionSchema<AbstractEntity>
    >,
UnaryModuleStateDbMixin
    implements UnaryModuleStateI
{
  bool pressAttention = true;
  late ModuleDbDS currentModuleEntity;
  bool _flag = true;

  _UnaryModuleState(this.currentModuleEntity): super();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        elevation: 4,
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff3a57e8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        title: Text(
          currentModuleEntity.name ?? "На найдено модуля с таким UUID",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            fontSize: 20,
            color: Color(0xfff9f9f9),
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xfff9f9f9),
            size: 24,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Icon(Icons.search, color: Color(0xffffffff), size: 22),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: Icon(Icons.edit, color: Color(0xfff9f9f9), size: 24),
          ),
        ],
      ),
      body: SingleChildScrollView(
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
                color: Color(0x1f000000),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.zero,
                border: Border.all(color: Color(0x4d9e9e9e), width: 1),
              ),
            ),
            MaterialButton(
              onPressed: () {
                setState(() => _flag = !_flag);
              },
              color: Color(0xffffffff),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
                side: BorderSide(color: Color(0xff808080), width: 1),
              ),
              padding: EdgeInsets.all(16),
              child: Text(
                _flag ? 'Red' : 'Green',
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
            MaterialButton(
              onPressed: () async {
                if (currentModuleEntity != null) {
                  await startLearning(currentModuleEntity.id);
                  var nextPage = await getNextLearnPage(currentModuleEntity);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => nextPage));
                }
              },
              color: Color(0xffffffff),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
                side: BorderSide(color: Color(0xff808080), width: 1),
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
            MaterialButton(
              onPressed: () async  {
                if (currentModuleEntity != null) {
                  var nextPage = await getNextLearnPage(currentModuleEntity);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => nextPage));
                }
              },
              color: Color(0xffffffff),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
                side: BorderSide(color: Color(0xff808080), width: 1),
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
            MaterialButton(
              onPressed: () {
                if (currentModuleEntity != null) {}
              },
              color: Color(0xffffffff),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
                side: BorderSide(color: Color(0xff808080), width: 1),
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
            MaterialButton(
              onPressed: () {},
              color: Color(0xffffffff),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
                side: BorderSide(color: Color(0xff808080), width: 1),
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
          ],
        ),
      ),
    );
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
