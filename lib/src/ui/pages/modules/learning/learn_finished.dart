///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../../../domain_layer/functions/words_BO.dart';
import '../../../../repositoris/db_data_source/folder.dart';
import '../../../../repositoris/db_data_source/module.dart';
import '../unary_module.dart';

class LearnCompleted extends StatelessWidget {
  final ModuleDbDS moduleEntity;

  LearnCompleted(this.moduleEntity);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child:Scaffold(
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
          moduleEntity.name ?? "Нет модуля с таким Uuid",
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
            child: Align(
              alignment: Alignment.center,
              child: LinearProgressIndicator(
                  backgroundColor: Color(0xff808080),
                  valueColor:
                      new AlwaysStoppedAnimation<Color>(Color(0xff3a57e8)),
                  value: 0.1,
                  minHeight: 3),
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment(0.0, -0.1),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 0, horizontal: 40),
                padding: EdgeInsets.zero,
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Color(0xff3a57e8),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.zero,
                  border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Поздравляем! Модуль выучен!",
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 20,
                              color: Color(0xfff9f9f9),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Align(
                          alignment: Alignment.center,
                          child: MaterialButton(
                            onPressed: () async {
                              await startLearning(moduleEntity.isarId);
                              var nextPage =
                                  await getNextLearnPage(moduleEntity, context: context,);
                              await nextPage(context);
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //         nextPage ));
                            },
                            color: Color(0xfff9f9f9),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                              side: BorderSide(
                                  color: Color(0xff808080), width: 1),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Text(
                              "Выучить заново",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                            textColor: Color(0xff000000),
                            height: 40,
                            minWidth: 170,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          color: Color(0xfff9f9f9),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                            side:
                                BorderSide(color: Color(0xff808080), width: 1),
                          ),
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Text(
                            "Вернуться к модулю",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          textColor: Color(0xff000000),
                          height: 40,
                          minWidth: 170,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    onWillPop: () async {
      var nextPage = await getNextLearnPage(
          moduleEntity,
          currTermList: [],
          progress: 1,
          context: context

      );
      await nextPage(context);
    return false;
    },
    );
  }
}
