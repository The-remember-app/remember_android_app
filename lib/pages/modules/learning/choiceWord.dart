///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../../models/folder.dart';
import '../../../models/term.dart';
import '../modules.dart';
import '../unary_module.dart';

MaterialButton getDefinitionVariable(Uuid wordId, BuildContext context,
    Uuid targetTerm, _ChoiceWordState currWidgetClass) {
  var word = words[wordId];
  var buttonIsDisabled = false;

  var buttonColor = Color(0xffffffff);
  if (currWidgetClass.buttonPressed[wordId] ?? false) {
    if (wordId == targetTerm) {
      buttonColor = Color(0xff00ff00);
      word?.choose_error_counter -= 1;
    } else {
      buttonColor = Color(0xffff0000);
      word?.choise_neg_error_counter += 1;
    }
  } else {
    if (wordId == targetTerm &&
        currWidgetClass.buttonPressed.values.any((isClicked) => isClicked)) {
      buttonColor = Color(0xff00ff00);
      word?.choose_error_counter += 1;
    }
  }
  if (currWidgetClass.buttonPressed.values.any((isClicked) => isClicked)) {
    buttonIsDisabled = true;
  }

  return
      // InkWell(
      // child:
      MaterialButton(
    onPressed: () {
      if (!buttonIsDisabled) {
        currWidgetClass
            .setState(() => currWidgetClass.buttonPressed[wordId] = true);
      }
    },
    color: buttonColor,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.zero,
      side: BorderSide(color: Color(0xff808080), width: 1),
    ),
    padding: EdgeInsets.all(16),
    child: Text(
      word?.definition ?? "Похоже слоа с таким UUID не существует",
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
    ),
    textColor: Color(0xff000000),
    height: 40,
    minWidth: 140,
  );
  // );
}

class ChoiceWord extends StatefulWidget {
  final Uuid moduleId;
  final Uuid wordId;
  final int progress;
  final int maxProgress;
  final List<Uuid> definitions;
  List<Uuid>? currTermUuid;

  ChoiceWord(this.moduleId, this.wordId, this.progress, this.maxProgress,
      this.definitions,
      [this.currTermUuid = null]);

  @override
  _ChoiceWordState createState() => _ChoiceWordState(
      moduleId, wordId, progress, maxProgress, definitions, currTermUuid);
}

class _ChoiceWordState extends State<ChoiceWord> {
  final Uuid moduleId;
  final Uuid wordId;
  final int progress;
  final int maxProgress;
  final List<Uuid> definitions;
  final Map<Uuid, bool> buttonPressed = Map<Uuid, bool>();
  List<Uuid>? currTermUuid;

  _ChoiceWordState(this.moduleId, this.wordId, this.progress, this.maxProgress,
      this.definitions,
      [this.currTermUuid = null]) {
    for (var definition in definitions) {
      buttonPressed[definition] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    var module = foldersOrModules[moduleId];
    var currWord = words[wordId];

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
            module?.name ?? "По такому UUID не найдено модуля",
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
              Navigator.pop(context);
            },
          ),
        ),
        body: GestureDetector(
          onPanUpdate: (details) {
            // Swiping in right direction.
            if (details.delta.dx > 0) {}

            // Swiping in left direction.
            if (details.delta.dx < 0) {
              if (buttonPressed.values.any((isClicked) => isClicked)) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => getNextLearnPage(
                            moduleId, null, progress, currTermUuid)));
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
                    value: 0.1,
                    minHeight: 3),
              ),
              Container(
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.all(0),
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Color(0x1f000000),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.zero,
                  border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    (currWord?.term ??
                        "Похоже, в словаре не хватает слов, это явно ошибка"),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      color: Color(0xff000000),
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
                  children: definitions.map<Widget>((wordDefinitionId) {
                    return getDefinitionVariable(
                        wordDefinitionId, context, wordId, this);
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
                          "Для того, чтобы перейти к следующему термину проведите пальцем по экрану от правого края к левому или просто нажмите на кнопку",
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
                            onPressed: () {
                              if (buttonPressed.values
                                  .any((isClicked) => isClicked)) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => getNextLearnPage(
                                            moduleId,
                                            null,
                                            progress,
                                            currTermUuid)));
                              }
                            },
                            color: Color(0xfff9f9f9) ,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: BorderSide(
                                  color:  (buttonPressed.values
                                      .any((isClicked) => isClicked))? Color(0xff3a57e8):Color(0xff707070),
                                  width: 2
                              ),
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
                            textColor:  (buttonPressed.values
                              .any((isClicked) => isClicked)) ? Color(0xff000000)  :Color(0xff707070),
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
        ));
  }
}
