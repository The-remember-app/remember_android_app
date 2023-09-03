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

class WriteFieldInLearnModTemplate extends StatelessWidget {
  final TermEntityDbDS currentTerm;
  final List<TermEntityDbDS> termsList;

  const WriteFieldInLearnModTemplate(this.currentTerm, this.termsList);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList =
        getWriteFieldsListInLearnProcess(currentTerm, termsList);

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
  late int? fieldsCount = null;

  OneVariantTermField(
      this.addTermInfo, this.currentTerm, this.originalTerm,{ int? fieldsCount = null}){
    this.fieldsCount = fieldsCount;
  }

  @override
  Widget build(BuildContext context) {
    if (fieldsCount == null){
      throw UnimplementedError("fieldsCount mast be implemented");
    }


    bool sourceOrFormName;
    if (addTermInfo != null) {
      sourceOrFormName = ((addTermInfo!.addInfoType == AddInfoType.usual_term ||
                  addTermInfo!.addInfoType == AddInfoType.other_form) &&
              (addTermInfo!.addingTextData != null &&
                  addTermInfo!.addingTextData!.isNotEmpty)) ||
          addTermInfo!.addInfoType == AddInfoType.abbreviation;
    } else {
      sourceOrFormName = false;
    }

    List<GetTermSourceOrFormName> sourceOrFormNameWidgetList = (sourceOrFormName
        ? <GetTermSourceOrFormName>[
            GetTermSourceOrFormName(addTermInfo!, currentTerm)
          ]
        : <GetTermSourceOrFormName>[]);

    var wwNavPr =
        Provider.of<WriteWordNavigationProvider>(context, listen: false);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: (sourceOrFormNameWidgetList as List<Widget>) +
          [
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
                      fieldsCount,
                      wwNavPr,
                      sourceOrFormNameWidgetList),
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

class GetInputFieldPart extends StatelessWidget {
  final String targetString;
  final int targetStringIndex;
  final LearnWriteEntity currentLearnWriteEntity;
  final List<WriteWordRes> userInputsContainer;

  late String strKey;
  late List<String> targetStrings;
  late TermEntityDbDS currentTerm;
  late List<LearnWriteEntity> sourceEntity;

  final WriteWordNavigationProvider wwNavPr;

  bool _realInitCalled = false;
  String userInput = "";

  GetInputFieldPart(this.targetString, this.targetStringIndex,
      this.currentLearnWriteEntity, this.wwNavPr, this.userInputsContainer) {
    if (userInputsContainer.length != targetStringIndex){
      throw UnimplementedError('Неправильная инициализация');
    }
    userInputsContainer.add(
        WriteWordRes(userInput, targetStringIndex,  strKey)


    );

  }

  void realInit(
    String strKey,
    List<String> targetStrings,
    TermEntityDbDS currentTerm,
    List<LearnWriteEntity> sourceEntity,
  ) {
    _realInitCalled = true;
    wwNavPr.addWriteWordProcessor(
        strKey, targetStrings, currentTerm, sourceEntity, userInputsContainer);
  }

  @override
  Widget build(BuildContext context) {
    if (!_realInitCalled) {
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
            userInput = text.trim().toLowerCase();
            userInputsContainer[targetStringIndex].userInput = userInput;
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
          controller: TextEditingController(),
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
            fillColor: Color(0xfff2f2f3),
            isDense: false,
            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            prefixIcon: Icon(Icons.edit, color: Color(0xff212435), size: 24),
          ),
        ),
      ),
    );
  }
}
