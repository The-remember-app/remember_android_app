///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';

import 'package:uuid/uuid.dart';

import '../../../../repositoris/db_data_source/folder.dart';
import '../../../../repositoris/db_data_source/module.dart';
import '../../../../repositoris/db_data_source/term.dart';
import '../modules.dart';
import '../unary_module.dart';

Padding getDefinitionVariable(TermEntityDbDS wordEntity, BuildContext context,
    TermEntityDbDS targetTermEntity, _ChoiceWordState currWidgetClass) {
  // var wordEntity = words[wordEntity];
  // var targetTermEntity = words[targetTerm];
  var buttonIsDisabled = false;

  var buttonColor = Color(0xffffffff);
  if (currWidgetClass.buttonPressed[wordEntity.isarId] ?? false) {
    if (wordEntity.isarId == targetTermEntity.isarId) {
      buttonColor = Color(0xff00ff00);
      wordEntity.chooseErrorCounter -= 1;
    } else {
      buttonColor = Color(0xffff0000);
      wordEntity.choiceNegErrorCounter += 1;
    }
  } else {
    if (wordEntity.isarId == targetTermEntity.isarId &&
        currWidgetClass.buttonPressed.values.any((isClicked) => isClicked)) {
      buttonColor = Color(0xff00ff00);
      wordEntity.chooseErrorCounter += 1;
    }
  }
  if (currWidgetClass.buttonPressed.values.any((isClicked) => isClicked)) {
    buttonIsDisabled = true;
  }

  return
      // InkWell(
      // child:
      Padding(
    padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
    child: MaterialButton(
      onPressed: () {
        if (!buttonIsDisabled) {
          currWidgetClass.setState(
              () => currWidgetClass.buttonPressed[wordEntity.isarId] = true);
        }
      },

        color: buttonColor,
      // elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
        side: BorderSide(color: Color(0xff3a57e8), width: 1),
      ),
      padding: EdgeInsets.all(16),
      child: Text(
        targetTermEntity.isTermReverseChoice()
            ? wordEntity.term
            : wordEntity.definition,
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
  );
  // );
}

class ChoiceWord extends StatefulWidget {
  final ModuleDbDS moduleEntity;
  final TermEntityDbDS wordEntity;
  final int progress;
  final int maxProgress;
  final List<TermEntityDbDS> definitions;
  final List<TermEntityDbDS>? currTermsList;
  final bool reverseTerm;

  ChoiceWord(this.moduleEntity, this.wordEntity, this.progress,
      this.maxProgress, this.definitions,
      [this.currTermsList = null, this.reverseTerm = false]);

  @override
  _ChoiceWordState createState() => _ChoiceWordState(
        moduleEntity,
        wordEntity,
        progress,
        maxProgress,
        definitions,
        currTermsList,
        reverseTerm,
      );
}

class _ChoiceWordState extends State<ChoiceWord> {
  final ModuleDbDS moduleEntity;
  final TermEntityDbDS wordEntity;
  final int progress;
  final int maxProgress;
  final List<TermEntityDbDS> definitions;
  final Map<int, bool> buttonPressed = Map<int, bool>();
  List<TermEntityDbDS>? currTermsList;
  final bool reverseTerm;

  _ChoiceWordState(
      this.moduleEntity,
      this.wordEntity,
      this.progress,
      this.maxProgress,
      this.definitions,
      this.currTermsList,
      this.reverseTerm) {
    for (var definition in definitions) {
      buttonPressed[definition.isarId] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    // var moduleEntity = foldersOrModules[moduleEntity];
    // var wordEntity = words[wordEntity];

    return WillPopScope(
      child: Scaffold(
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
              moduleEntity.name ?? "По такому UUID не найдено модуля",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 14,
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
                Navigator.pushNamed(
                  context,
                  '/module_id',
                  arguments: {
                    'moduleId': moduleEntity,
                  },
                );
                // Navigator.pop(context);
              },
            ),
          ),
          body: GestureDetector(
            onPanUpdate: (details) async {
              // Swiping in right direction.
              if (details.delta.dx > 0) {}

              // Swiping in left direction.
              if (details.delta.dx < 0) {
                if (buttonPressed.values.any((isClicked) => isClicked)) {
                  var nextPage = await getNextLearnPage(
                      moduleEntity,
                      currTermList: currTermsList,
                      progress: progress,
                      context: context

                  );
                  await nextPage(context);
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => nextPage));
                }
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                  child: LinearProgressIndicator(
                      backgroundColor: Color(0xff808080),
                      valueColor:
                          new AlwaysStoppedAnimation<Color>(Color(0xff3a57e8)),
                      value: progress.toDouble() / maxProgress.toDouble(),
                      minHeight: 3),
                ),
                Container(
                  margin: EdgeInsets.all(0),
                  padding: EdgeInsets.all(0),
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Color(0x00000000),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.zero,
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    padding: EdgeInsets.zero,
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Color(0xffc8d0f9),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        (wordEntity.maybeReverseTermChoice ??
                            "Похоже, в словаре не хватает слов, это явно ошибка"),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          fontSize: 20,
                          color: Color(0xff7b13a0),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.zero,
                    shrinkWrap: false,
                    physics: ScrollPhysics(),
                    children: definitions.map<Widget>((wordDefinitionEntity) {
                      return getDefinitionVariable(
                          wordDefinitionEntity, context, wordEntity, this);
                    }).toList(),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                          child: Text(
                            "Для того, чтобы перейти к следующему термину, "
                            "проведите пальцем по экрану от правого края "
                            "к левому или просто нажмите на кнопку",
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 10,
                              color: Color(0xff707070),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 20),
                          child: Align(
                            alignment: Alignment.center,
                            child: MaterialButton(
                              onPressed: () async {
                                if (buttonPressed.values
                                    .any((isClicked) => isClicked)) {
                                  var nextPage = await getNextLearnPage(
                                    moduleEntity,
                                    currTermList: currTermsList,
                                    progress: progress,
                                    context: context,
                                  );
                                  await nextPage(context);
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => nextPage));
                                }
                              },
                              color: Color(0xfff9f9f9),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                side: BorderSide(
                                    color: (buttonPressed.values
                                            .any((isClicked) => isClicked))
                                        ? Color(0xff3a57e8)
                                        : Color(0xff707070),
                                    width: 2),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              child: Text(
                                "К следующему термину",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                              textColor: (buttonPressed.values
                                      .any((isClicked) => isClicked))
                                  ? Color(0xff000000)
                                  : Color(0xff707070),
                              height: 40,
                              minWidth: 140,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
      onWillPop: () async {
        Navigator.pushNamed(
          context,
          '/module_id',
          arguments: {
            'moduleId': moduleEntity,
          },
        );
        return false;
      },
    );
  }
}
