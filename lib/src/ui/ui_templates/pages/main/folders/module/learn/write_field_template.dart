import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';
import 'package:the_remember/api_package/lib/api_package.dart';
import 'package:the_remember/src/repositoris/db_data_source/term.dart';

import '../../../../../../../../main.dart';
import '../../../../../../../domain_layer/functions/words_BO.dart';
import '../../../../../../../domain_layer/providers/main/folders/module/learning/write/write_word_navigation.dart';
import '../../../../../../../repositoris/db_data_source/term_adding_info.dart';
import '../../../../../abstract_ui.dart';

class WriteFieldInLearnModTemplate extends StatelessWidget {
  final TermEntityDbDS currentTerm;
  final List<TermEntityDbDS> termsList;

  const WriteFieldInLearnModTemplate(this.currentTerm, this.termsList);

  @override
  Widget build(BuildContext context) {
    var wwNavPr =
        Provider.of<WriteWordNavigationProvider>(context, listen: false);

    List<Widget> widgetList =
        getWriteFieldsListInLearnProcess(currentTerm, termsList, wwNavPr);

    // fields += [for (var i in termsList) ];

    return Expanded(
      flex: 1,
      child: ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.zero,
        shrinkWrap: false,
        physics: ScrollPhysics(),
        children: widgetList,
        // .filter()
        // .
        //     .map<Widget>((i) => OneVarioubleTermField(i)),
      ),
    );
  }
}

class OneVariantTermField extends StatelessWidget {
  final TermAddingInfoDbDS? addTermInfo;
  final TermEntityDbDS currentTerm;
  final TermEntityDbDS originalTerm;
  late int fieldsCount;
  late int currentFieldIndex;

  OneVariantTermField(this.addTermInfo, this.currentTerm, this.originalTerm,
      {int? fieldsCount = null, int? currentFieldIndex = null}) {
    if (fieldsCount != null) {
      this.fieldsCount = fieldsCount!;
    }
    if (currentFieldIndex != null) {
      this.currentFieldIndex = currentFieldIndex!;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (fieldsCount == null || currentFieldIndex == null) {
      throw UnimplementedError(
          "fieldsCount and currentFieldIndex mast be implemented");
    }
    var sourceOrFormNameWidgetListAsSpecType =
        sourceOrFormNameProcessor(addTermInfo, currentTerm);
    List<Widget> sourceOrFormNameWidgetList = [
      for (var i in sourceOrFormNameWidgetListAsSpecType) i as Widget
    ];

    var wwNavPr =
        Provider.of<WriteWordNavigationProvider>(context, listen: false);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: (sourceOrFormNameWidgetList) +
          <Widget>[
            // Expanded(
            //   // flex: 1,
            //   child:

            Expanded(
              flex: 1,
              child: Container(
                child: Wrap(
                  // alignment: WrapAlignment.center,
                  // runAlignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  // verticalDirection: VerticalDirection.down,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisSize: MainAxisSize.max,
                  children: getOneWriteFieldInLearnProcess(
                      addTermInfo,
                      currentTerm,
                      fieldsCount!,
                      currentFieldIndex,
                      wwNavPr,
                      sourceOrFormNameWidgetListAsSpecType
                          as List<GetTermSourceOrFormName>),
                ),
              ),
            ),
          ],
      // clipBehavior: Clip.antiAlias,
    );
  }
}

class GetTermSourceOrFormName extends StatelessWidget {
  final TermAddingInfoDbDS addTermInfo;
  final TermEntityDbDS currentTerm;
  late String text;

  GetTermSourceOrFormName(this.addTermInfo, this.currentTerm) {
    if (addTermInfo.addInfoType == AddInfoType.abbreviation) {
      text = "Сокр.";
    } else if (addTermInfo.dialectOrArea != null) {
      text = addTermInfo.dialectOrArea!;
  } else {
      text = addTermInfo.addingTextData!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:

          // Wrap(
          //
          //     children: [

          UnconstrainedBox(
        child: Container(
          margin: EdgeInsets.only(right: 10.0),
          padding: EdgeInsets.zero,
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Color(0x1f000000),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(4.0),
            border: Border.all(color: Color(0x4d9e9e9e), width: 1),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              text,
              // textAlign: TextAlign.start,
              // overflow: TextOverflow.clip,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 14,
                color: Color(0xff000000),
              ),
            ),
          ),
        ),
      ),
      // constrainedAxis: Axis.horizontal,
      // alignment: AlignmentGeometry.lerp(a, b, t),
      //   ],
      //   crossAxisAlignment: WrapCrossAlignment.center,
      //
      // ),
    );
  }
}

class GetTextPart extends StatelessWidget {
  final String text;

  const GetTextPart(this.text);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: UnconstrainedBox(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
          padding: EdgeInsets.zero,
          // width: 150,
          height: 20,
          decoration: BoxDecoration(
            color: Color(0x00ffffff),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.zero,
            border: Border.all(color: Color(0xbebebe), width: 0),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              text,
              textAlign: TextAlign.start,
              maxLines: 1,
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
      ),
    );
  }
}

class GetInputFieldPart extends StatefulWidget {
  final String targetString;
  final int targetStringIndex;
  final LearnWriteEntity currentLearnWriteEntity;
  List<WriteWordRes> userInputsContainer;
  final int fieldsCount;
  final int currentFieldIndex;

  late String strKey;
  late List<String> targetStrings;
  late TermEntityDbDS currentTerm;
  late List<LearnWriteEntity> sourceEntity;

  final WriteWordNavigationProvider wwNavPr;

  bool _realInitCalled = false;
  String userInput = "";

  bool? errorStatus = null;

  GetInputFieldPart(
    this.targetString,
    this.targetStringIndex,
    this.currentLearnWriteEntity,
    this.wwNavPr,
    this.userInputsContainer,
    this.fieldsCount,
    this.currentFieldIndex, {
    Future<void> Function()? errorCallback = null,
  }) {
    if (userInputsContainer.length != targetStringIndex) {
      throw UnimplementedError('Неправильная инициализация');
    }
    userInputsContainer
        .add(WriteWordRes("", targetStringIndex, "", null, null));
  }

  void realInit(String strKey, List<String> targetStrings,
      TermEntityDbDS currentTerm, List<LearnWriteEntity> sourceEntity,
      {List<WriteWordRes>? oldUserInputsContainer = null}) {
    _realInitCalled = true;
    if (oldUserInputsContainer == null) {
      userInputsContainer[targetStringIndex]
        ..userInput = userInput
        ..keyString = strKey;
      wwNavPr.addWriteWordProcessor(strKey, targetStrings, currentTerm,
          sourceEntity, userInputsContainer);
    } else {
      oldUserInputsContainer.addAll(userInputsContainer);
      userInputsContainer = oldUserInputsContainer;
    }
  }

  @override
  _GetInputFieldPartState createState() => _GetInputFieldPartState();
}

class _GetInputFieldPartState
    extends AbstractUIStatefulWidget<GetInputFieldPart> {
  _GetInputFieldPartState() {}

  @override
  Widget build(BuildContext context) {
    bool isDisabled = false;
    widget.userInputsContainer[widget.targetStringIndex]!.errorCallback =
        ((BuildContext context, AbstractUIStatefulWidget setStateWidget) async {
      widget.errorStatus = true;
      setStateWidget.setState(() => null);
    });
    widget.userInputsContainer[widget.targetStringIndex]!.successCallback =
        ((BuildContext context, AbstractUIStatefulWidget setStateWidget) async {
      widget.errorStatus = false;
      setStateWidget.setState(() => null);
    });
    if ((widget.wwNavPr.errorCountMap[widget.currentLearnWriteEntity] ?? -1) == 0){
      isDisabled = true;
      widget.userInput = widget.currentLearnWriteEntity.targetWrite;
      widget.userInputsContainer[widget.targetStringIndex].userInput =
          widget.userInput;
    }

    // setState()
    if (!widget._realInitCalled) {
      throw UnimplementedError('realInit must called before build');
    }
    return Expanded(
      flex: 1,
      child: Container(
        margin: EdgeInsets.all(00),
        padding: EdgeInsets.zero,
        width: 200,
        height: 50,
        decoration: BoxDecoration(
          color: Color(0x1f000000),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(color: Color(0x4d9e9e9e), width: 1),
        ),
        child: TextField(
          onChanged: (text) async {
            widget.userInput = text.trim().toLowerCase();
            widget.userInputsContainer[widget.targetStringIndex].userInput =
                widget.userInput;
            // if (text.toLowerCase() ==
            //     widget.wordEntity.maybeReverseDefinitionWrite.toLowerCase()) {
            //   writeWordChanging(widget.wordEntity, widget.inputWord, widget.termsPr.termsList!, widget.termsPr);
            //   learnNavPr.activePageNumber += 1;
            // words[wordId]?.write_error_counter -= 1;
            // var nextPage = await getNextLearnPage(
            //   moduleEntity,
            //   currTermList: currTermsList,
            //   progress: progress,
            //   InputedWord: inputWord,
            //   showPostScreen: false,
            //   context: context,
            // );
            // await nextPage(context);
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => nextPage));
            // }
            // print("onChanged");
            // print("Введенный текст: $text");
          },
          onSubmitted: (text) async {
            widget.wwNavPr.isUserCompletedInput();
            if (widget.wwNavPr.writtenWord != null) {
              widget.wwNavPr
                  .checkUserInput(context, this, isAnotherWrite: true);
            }
          },
          enabled: !isDisabled,
          controller: TextEditingController(text: widget.userInput),
          obscureText: false,
          textAlign: TextAlign.start,
          maxLines: 1,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 14,
            color: Color(0xff000000),
          ),
          decoration: InputDecoration(
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
              borderSide: BorderSide(color: Color(0xff000000), width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
              borderSide: BorderSide(color: Color(0xff000000), width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
              borderSide: BorderSide(color: Color(0xff000000), width: 1),
            ),
            labelText: "Введите значение темина",
            labelStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontSize: 14,
              color: Color(0xff000000),
            ),
            hintText: "Начните вводить",
            hintStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontSize: 14,
              color: Color(0xff000000),
            ),
            filled: true,
            fillColor: widget.errorStatus == null
                ? Color(0xfff2f2f3)
                : (widget.errorStatus! ? Color(0xfff87878) : Color(0xffadffad)),
            isDense: false,
            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            prefixIcon: Icon(Icons.edit, color: Color(0xff212435), size: 24),
          ),
        ),
      ),
    );
  }
}
