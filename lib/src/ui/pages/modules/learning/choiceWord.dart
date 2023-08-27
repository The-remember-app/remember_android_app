///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_remember/src/ui/pages/modules/learning/progress_bar.dart';

import 'package:uuid/uuid.dart';

import '../../../../domain_layer/functions/words_BO.dart';
import '../../../../domain_layer/providers/choice_buttons_in_learn_screen.dart';
import '../../../../domain_layer/providers/learning_navigation.dart';
import '../../../../domain_layer/providers/terms_in_module.dart';
import '../../../../repositoris/db_data_source/folder.dart';
import '../../../../repositoris/db_data_source/module.dart';
import '../../../../repositoris/db_data_source/term.dart';
import '../../../ui_templates/abstract_ui.dart';
import '../modules.dart';
import '../unary_module.dart';

// Padding getDefinitionVariable(TermEntityDbDS wordEntity, BuildContext context,
//     TermEntityDbDS targetTermEntity, _ChoiceWordState currWidgetClass) {
//   // var wordEntity = words[wordEntity];
//   // var targetTermEntity = words[targetTerm];
//
//
//   return Text();
//   // InkWell(
//   // child:
//   ;
//   // );
// }

class ChoiceWord extends StatefulWidget {
  final TermsInModuleProvider termsPr;
  final LearnScreensNavigationProvider learnNavPr;
  late TermEntityDbDS wordEntity;
  late int progress;
  late int maxProgress;
  late List<TermEntityDbDS> definitions;
  late bool reverseTerm;
  late Map<int, bool> buttonPressed = Map<int, bool>();
  bool buttonIsDisabled = false;

  ChoiceWord({
    required this.termsPr,
    required this.learnNavPr,
  }) {
    progress = learnNavPr.activePageNumber;
    maxProgress = termsPr.learningIterationTermsList!.length;
    wordEntity = termsPr.learningIterationTermsList![progress];
    reverseTerm = wordEntity.isTermReverseChoice();

    var definitionDataPre = termsPr.termsList!;
    definitionDataPre.shuffle();

    var definitionData = [
      for (var ww in definitionDataPre)
        if (ww.isarId != wordEntity.isarId) ww
    ];
    definitionData = definitionData.sublist(0, 3);
    definitionData.add(wordEntity);
    definitionData.shuffle();
    definitions = definitionData;
    for (var definition in definitions) {
      buttonPressed[definition.isarId] = false;
    }
  }

  @override
  _ChoiceWordState createState() => _ChoiceWordState();
}

class _ChoiceWordState extends AbstractUIStatefulWidget<ChoiceWord> {
  bool nextScreen = false;
  // final ModuleDbDS moduleEntity;
  // final TermEntityDbDS wordEntity;
  // final int progress;
  // final int maxProgress;
  // final List<TermEntityDbDS> definitions;
  // final Map<int, bool> buttonPressed = Map<int, bool>();
  // List<TermEntityDbDS>? currTermsList;
  // final bool reverseTerm;

  // _ChoiceWordState(
  //     this.moduleEntity,
  //     this.wordEntity,
  //     this.progress,
  //     this.maxProgress,
  //     this.definitions,
  //     this.currTermsList,
  //     this.reverseTerm) {
  //   for (var definition in definitions) {
  //     buttonPressed[definition.isarId] = false;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // var moduleEntity = foldersOrModules[moduleEntity];
    // var wordEntity = words[wordEntity];
    // var learnNavPr = Provider.of<LearnScreensNavigationProvider>(context, listen: false);
    var termsPr = Provider.of<TermsInModuleProvider>(context, listen: false);

    var learnNavPr =
        Provider.of<LearnScreensNavigationProvider>(context, listen: false);
    return GestureDetector(
      onPanUpdate: (details) async {



        // Swiping in right direction.
        if (details.delta.dx > 0) {}

        // Swiping in left direction.
        if (details.delta.dx < 0) {
          if (widget.buttonPressed.values.any((isClicked) => isClicked)) {

            if (!nextScreen) {
              nextScreen = true;
              learnNavPr.activePageNumber += 1;
            }
            // var nextPage = await getNextLearnPage(
            //     moduleEntity,
            //     currTermList: currTermsList,
            //     progress: progress,
            //     context: context
            //
            // );
            // await nextPage(context);
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
          LearnProgressBarWidget(),
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
                  (widget.wordEntity.maybeReverseTermChoice ??
                      "Похоже, в словаре не хватает слов, это явно ошибка") + " " + (learnNavPr.activePageNumber.toString() + " / " +  termsPr.learningIterationTermsList!.length.toString()),
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
              child: ChoiceButtonAddProvider(
                choiceWordObj: widget,
              )),
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
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
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
                          if (widget.buttonPressed.values
                              .any((isClicked) => isClicked)) {
                            learnNavPr.activePageNumber += 1;
                            nextScreen = true;
                            // var nextPage = await getNextLearnPage(
                            //   moduleEntity,
                            //   currTermList: currTermsList,
                            //   progress: progress,
                            //   context: context,
                            // );
                            // await nextPage(context);
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
                              color: (widget.buttonPressed.values
                                      .any((isClicked) => isClicked))
                                  ? Color(0xff3a57e8)
                                  : Color(0xff707070),
                              width: 2),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Text(
                          "К следующему термину",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        textColor: (widget.buttonPressed.values
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
    );
  }
}

class ChoiceButtonAddProvider extends StatelessWidget {
  final ChoiceWord choiceWordObj;

  const ChoiceButtonAddProvider({super.key, required this.choiceWordObj});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) =>
                ChoiceLearnButtonsProvider(choiceWordObj.termsPr, choiceWordObj.learnNavPr)),
        // Provider(create: (context) => SomeOtherClass()),
      ],
      child: ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.zero,
        shrinkWrap: false,
        physics: ScrollPhysics(),
        children: choiceWordObj.definitions
            .map<Widget>(
                (wordDefinitionEntity) => ChoiceButtonInLearningWidget(choiceWordObj: choiceWordObj, wordDefinitionEntity:wordDefinitionEntity))
            .toList(),
      ),
    );
  }
}

class ChoiceButtonInLearningWidget extends StatefulWidget {
  final ChoiceWord choiceWordObj;
  final TermEntityDbDS wordDefinitionEntity;

  const ChoiceButtonInLearningWidget({super.key, required this.choiceWordObj, required this.wordDefinitionEntity});

  @override
  _ChoiceButtonInLearningWidgetState createState() =>
      _ChoiceButtonInLearningWidgetState();
}

class _ChoiceButtonInLearningWidgetState
    extends AbstractUIStatefulWidget<ChoiceButtonInLearningWidget> {

  @override
  Widget build(BuildContext context) {
    return Consumer<ChoiceLearnButtonsProvider>(builder: (context, choicePr, child)
    {

      var buttonPressed = widget.choiceWordObj.buttonPressed;
      var wordEntity = widget.wordDefinitionEntity;
      var targetTermEntity = widget.choiceWordObj.wordEntity;

      var buttonColor = Color(0xffffffff);
      if (buttonPressed[wordEntity.isarId] ?? false) {
        if (wordEntity.isarId == targetTermEntity.isarId) {
          buttonColor = Color(0xff00ff00);
          // wordEntity.chooseErrorCounter -= 1;
        } else {
          buttonColor = Color(0xffff0000);
          // wordEntity.choiceNegErrorCounter += 1;
        }
      } else {
        if (wordEntity.isarId == targetTermEntity.isarId &&
            buttonPressed.values.any((isClicked) => isClicked)) {
          buttonColor = Color(0xff00ff00);
          // wordEntity.chooseErrorCounter += 1;
        }
      }
      if (buttonPressed.values.any((isClicked) => isClicked)) {
        widget.choiceWordObj.buttonIsDisabled = true;
      }
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
        child: MaterialButton(
          onPressed: () {
            if (! widget.choiceWordObj.buttonIsDisabled) {
              choiceWordChanging(targetTermEntity, wordEntity, widget.choiceWordObj.definitions,  widget.choiceWordObj.termsPr);

                  buttonPressed[wordEntity.isarId] = true;
                  choicePr.buttonClicked = wordEntity;
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
    });
  }
}
