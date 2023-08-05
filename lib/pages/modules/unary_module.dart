///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';
import 'package:the_remember/pages/modules/unary_folder.dart';
import 'package:uuid/uuid.dart';

import '../../models/folder.dart';
import '../../models/term.dart';
import 'learning/choiceWord.dart';
import 'learning/learn_finished.dart';
import 'learning/writeWord.dart';
import 'learning/writeWordOneMoreTime.dart';
import 'modules.dart';

Widget getNextLearnPage(
  Uuid moduleId, [
  List<TermEntity>? currTermList = null,
  int progress = -1,
  List<Uuid>? currTermUuidList = null,
]) {
  // return choiceWord;
  // if (currTermList == null){
  progress += 1;
  if (currTermList == null && currTermUuidList != null) {
    currTermList ??= [for (var termId in currTermUuidList) words[termId]!];
  }
  if (currTermList == null) {
    currTermList ??= [
      for (var w in words.values)
        if (w.module_id == moduleId &&
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
    return LearnCompleted(moduleId);
  }
  // if (progress >= currTermUuidList!.length){
  //   return UnaryModule() ;
  // }
  // }
  if (progress > 9 || progress >= currTermList.length) {
    return UnaryModule(moduleId);
  }
  var currentWord = currTermList[progress];

  if (currentWord.choose_error_counter == 0) {
    return WriteWord(moduleId, currentWord.id, progress, currTermList.length,
        [for (var term in currTermList) term.id]
    );
  } else {
    var definitionDataPre = [
      for (var w in words.values)
        if (w.module_id == moduleId) w
    ];
    definitionDataPre.shuffle();

    var definitionData = [
      for (var ww in definitionDataPre )
        if (ww.id != currentWord.id) ww.id
    ];
    definitionData = definitionData.sublist(0, 3);
    definitionData.add(currentWord.id);
    definitionData.shuffle();
    return ChoiceWord(moduleId, currentWord.id, progress, currTermList.length,
        definitionData, [for (var term in currTermList) term.id]);
  }
}

class UnaryModule extends StatefulWidget {
  final Uuid moduleId;

  UnaryModule(this.moduleId);

  @override
  _UnaryModuleState createState() => _UnaryModuleState(moduleId);
}

class _UnaryModuleState extends State<UnaryModule> {
  bool pressAttention = true;
  final Uuid moduleId;
  bool _flag = true;

  _UnaryModuleState(this.moduleId);

  @override
  Widget build(BuildContext context) {
    final module = foldersOrModules[moduleId];
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
          module?.name ?? "На найдено модуля с таким UUID",
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
              onPressed: () {
                if (module != null) {
                  for (var w in words.values) {
                    if (w.module_id == moduleId) {
                      w.choose_error_counter = 1;
                      w.write_error_counter = 1;
                      w.choise_neg_error_counter = 0;
                    }
                  }
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => getNextLearnPage(module.id)));
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
              onPressed: () {
                if (module != null) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => getNextLearnPage(module.id)));
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
}
