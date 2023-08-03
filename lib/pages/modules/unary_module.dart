
///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import 'modules.dart';


class UnaryModule extends StatelessWidget {

  final Uuid moduleId;

  UnaryModule(this.moduleId);

  @override
  Widget build(BuildContext context) {
    final folder = foldersOrModules[moduleId];
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar:
      AppBar(
        elevation:4,
        centerTitle:false,
        automaticallyImplyLeading: false,
        backgroundColor:Color(0xff3a57e8),
        shape:RoundedRectangleBorder(
          borderRadius:BorderRadius.zero,
        ),
        title:Text(
          "Module Name",
          style:TextStyle(
            fontWeight:FontWeight.w700,
            fontStyle:FontStyle.normal,
            fontSize:20,
            color:Color(0xfff9f9f9),
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
        actions:[
          Icon(Icons.search,color:Color(0xffffffff),size:22),
          Padding(
            padding:EdgeInsets.fromLTRB(0, 0, 10, 0),
            child:Icon(Icons.edit,color:Color(0xfff9f9f9),size:24),
          ),
        ],
      ),
      body:SingleChildScrollView(
        child:
        Column(
          mainAxisAlignment:MainAxisAlignment.start,
          crossAxisAlignment:CrossAxisAlignment.stretch,
          mainAxisSize:MainAxisSize.max,
          children: [
            Container(
              margin:EdgeInsets.all(10),
              padding:EdgeInsets.symmetric(vertical: 20,horizontal:10),
              width:200,
              height:200,
              decoration: BoxDecoration(
                color:Color(0x1f000000),
                shape:BoxShape.rectangle,
                borderRadius:BorderRadius.zero,
                border:Border.all(color:Color(0x4d9e9e9e),width:1),
              ),
            )

            ,
            MaterialButton(
              onPressed:(){},
              color:Color(0xffffffff),
              elevation:0,
              shape:RoundedRectangleBorder(
                borderRadius:BorderRadius.zero,
                side:BorderSide(color:Color(0xff808080),width:1),
              ),
              padding:EdgeInsets.all(16),
              child:Text("Карточки", style: TextStyle( fontSize:14,
                fontWeight:FontWeight.w400,
                fontStyle:FontStyle.normal,
              ),),
              textColor:Color(0xff000000),
              height:40,
              minWidth:140,
            ),
            MaterialButton(
              onPressed:(){},
              color:Color(0xffffffff),
              elevation:0,
              shape:RoundedRectangleBorder(
                borderRadius:BorderRadius.zero,
                side:BorderSide(color:Color(0xff808080),width:1),
              ),
              padding:EdgeInsets.all(16),
              child:Text("Заучивание", style: TextStyle( fontSize:14,
                fontWeight:FontWeight.w400,
                fontStyle:FontStyle.normal,
              ),),
              textColor:Color(0xff000000),
              height:40,
              minWidth:140,
            ),
            MaterialButton(
              onPressed:(){},
              color:Color(0xffffffff),
              elevation:0,
              shape:RoundedRectangleBorder(
                borderRadius:BorderRadius.zero,
                side:BorderSide(color:Color(0xff808080),width:1),
              ),
              padding:EdgeInsets.all(16),
              child:Text("Тест", style: TextStyle( fontSize:14,
                fontWeight:FontWeight.w400,
                fontStyle:FontStyle.normal,
              ),),
              textColor:Color(0xff000000),
              height:40,
              minWidth:140,
            ),
          ],),),
    )
    ;}
}
