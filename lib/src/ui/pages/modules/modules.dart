///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:the_remember/src/repositoris/db_data_source/user.dart';

import '../../../domain_layer/data_mixins/modules/modules.dart';
import '../../../repositoris/db_data_source/folder.dart';
import '../../../repositoris/db_data_source/module.dart';
import '../../../repositoris/db_data_source/term.dart';
import '../../../urils/db/dbMixins.dart';
import '../../ui_templates/buttom_nav_bar.dart';
import 'unary_folder.dart';
import 'unary_module.dart';
import '../../ui_templates/abstract_ui.dart';

class StartModule extends StatefulWidget {
  StartModule() : super();

  @override
  StartModuleState createState() => StartModuleState();

  static InkWell getFolder(FolderDbDS folder, BuildContext context) => InkWell(
        child: Container(
          margin: EdgeInsets.all(0),
          padding: EdgeInsets.all(0),
          width: 200,
          height: 100,
          decoration: BoxDecoration(
            color: Color(0x00000000),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.zero,
            border: Border.all(color: Color(0x4d9e9e9e), width: 1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              IconButton(
                icon: Icon(Icons.dashboard),
                onPressed: () {},
                color: Color(0xfffffdc0),
                iconSize: 64,
              ),
              Text(
                folder.name,
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                  color: Color(0xff000000),
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          // Здесь мы используем сокращенную форму:
          // Navigator.of(context).push(route)
          // PonyDetailPage принимает pony id,
          // который мы и передали
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => UnaryFolder(folder.isarId)));
        },
      );

  static InkWell getModule(ModuleDbDS currModule, BuildContext context) =>
      InkWell(
        child: Container(
          margin: EdgeInsets.all(0),
          padding: EdgeInsets.all(0),
          width: 200,
          height: 100,
          decoration: BoxDecoration(
            color: Color(0x00000000),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.zero,
            border: Border.all(color: Color(0x4d9e9e9e), width: 1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              IconButton(
                icon: Icon(Icons.description),
                onPressed: () {},
                color: Color(0xffffdfba),
                iconSize: 64,
              ),
              Text(
                currModule.name,
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                  color: Color(0xff000000),
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          // Здесь мы используем сокращенную форму:
          // Navigator.of(context).push(route)
          // PonyDetailPage принимает pony id,
          // который мы и передали
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => UnaryModule(currModule)));
        },
      );
}

class StartModuleState extends AbstractUIStatefulWidget<StartModule>
    with
        OpenAndClose3<CollectionSchema<FolderDbDS>,
            CollectionSchema<ModuleDbDS>,
            CollectionSchema<UserDbDS>>,
        StartModuleDbMixin
    implements
        GetDataFromDbI {
  StartModuleState() : super();

  List<Widget> getFolderAndModulesUI(BuildContext context) {
    var foldersDataUI = rootFolders.map<Widget>((KeyValPair) {
      final folder = KeyValPair;
      return StartModule.getFolder(folder, context);
    }).toList();
    var modulesDataUI = rootModules.map<Widget>((KeyValPair) {
      final module = KeyValPair;
      return StartModule.getModule(module, context);
    }).toList();
    return foldersDataUI + modulesDataUI;
  }

  @override
  Widget build(BuildContext context) {
    var foldersAndModulesUI = getFolderAndModulesUI(context);

    // var data1 = data.entries.map<int>( (key, val) => 2 );
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
            "Modules",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
              fontSize: 20,
              color: Color(0xfff9f9f9),
            ),
          ),
          actions: [
            Icon(Icons.search, color: Color(0xffffffff), size: 24),
          ],
        ),
        body: Stack(
          alignment: Alignment.topLeft,
          children: [
            ListView(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.all(0),
              shrinkWrap: false,
              physics: ScrollPhysics(),
              children: foldersAndModulesUI,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 0, 16, 16),
                padding: EdgeInsets.all(0),
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Color(0xff3956e9),
                  shape: BoxShape.circle,
                  border: Border.all(color: Color(0x199e9e9e), width: 1),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {},
                    color: Color(0xfff9f9f9),
                    iconSize: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: MainBottomNavigationBar(),
      ),
      onWillPop: () async {
        return false;
      },
    );
  }

  @override
  void dispose() async {
    // streamSubscription?.cancel();
    // dispose();
    super.dispose();
  }
}

/*



 */
