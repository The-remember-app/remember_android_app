///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

import '../../../domain_layer/data_mixins/modules/unary_folder.dart';
import '../../../repositoris/db_data_source/folder.dart';
import '../../../repositoris/db_data_source/module.dart';
import '../../../urils/db/abstract_entity.dart';
import '../../../urils/db/dbMixins.dart';
// import '../../repositoris/folder_repository/local_db_data_source/folder.dart';
import '../../ui_templates/abstract_ui.dart';
import 'modules.dart';

class UnaryFolder extends StatefulWidget {
  late int folderId;

  UnaryFolder(this.folderId);

  @override
  UnaryFolderState createState() => UnaryFolderState(folderId);
}


class UnaryFolderState
    extends AbstractUIStatefulWidget<UnaryFolder>
    with OpenAndClose3<
        CollectionSchema<FolderDbDS>,
        CollectionSchema<ModuleDbDS>,
        CollectionSchema<TermEntityDbDS>
    >, UnaryFolderDbMixin
    implements  UnaryFolderI, GetDataFromDbI

{
  late int folderId;

  UnaryFolderState(this.folderId);


  List<Widget> getFolderAndModulesUI(BuildContext context) {


    var foldersDataUI = subFolders.map<Widget>((KeyValPair) {
      final folder = KeyValPair;
      return StartModule.getFolder(folder, context);
    }).toList();
    var modulesDataUI = currModules.map<Widget>((KeyValPair) {
      final module = KeyValPair ;
      return StartModule.getModule(module, context);
    }).toList();
    return foldersDataUI + modulesDataUI;
  }


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
          folderEntity?.name ?? "Не найдено ничего по этому UUID",
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
            children: getFolderAndModulesUI(context),
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
    );
  }


}
