///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../../domain_layer/data_mixins/modules/unary_folder.dart';
import '../../../domain_layer/providers/folder_module.dart';
import '../../../domain_layer/providers/sub_folder_modules.dart';
import '../../../repositoris/db_data_source/folder.dart';
import '../../../repositoris/db_data_source/module.dart';
import '../../../repositoris/db_data_source/term.dart';
import '../../../urils/db/abstract_entity.dart';
import '../../../urils/db/dbMixins.dart';

// import '../../repositoris/folder_repository/local_db_data_source/folder.dart';
import '../../ui_states/modules/unary_folder.dart';
import '../../ui_templates/abstract_ui.dart';
import 'modules.dart';

class UnaryFolder extends StatefulWidget {
  final DFMapper dfMapper;

  const UnaryFolder({super.key, required this.dfMapper});

  @override
  UnaryFolderState createState() => UnaryFolderState();
}

class UnaryFolderState extends AbstractUIStatefulWidget<UnaryFolder> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        FoldersListProcessor( dfMapper: widget.dfMapper),
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
    );
  }

  @override
  void dispose() async {
    super.dispose();
  }
}

class LoadedFoldersList extends StatelessWidget {
  final DFMapper dfMapper;

  const LoadedFoldersList({super.key, required this.dfMapper});

  @override
  Widget build(BuildContext context) {
    var subFmPr =
        Provider.of<SubFolderAndModuleProvider>(context, listen: false);
    var fmPr = Provider.of<FolderAndModuleProvider>(context, listen: false);
    return ListView(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.all(0),
      shrinkWrap: false,
      physics: ScrollPhysics(),
      children: getFolderAndModulesUI(context, subFmPr, fmPr),
    );
  }

  List<Widget> getFolderAndModulesUI(BuildContext context,
      SubFolderAndModuleProvider subFmPr, FolderAndModuleProvider fmPr) {
    var foldersDataUI = subFmPr.subFoldersList!.map<Widget>((folder) {
      return OneFolderListItem(currentFolder: folder, fmPr: fmPr, subFmPr: subFmPr);
    }).toList();
    var modulesDataUI = subFmPr.subModulesList!.map<Widget>((module) {
      return OneModuleListItem(currentModule: module, fmPr: fmPr, subFmPr: subFmPr);
    }).toList();
    return foldersDataUI + modulesDataUI;
  }
}

class OneFolderListItem extends StatelessWidget {
  final FolderAndModuleProvider fmPr;
  final FolderDbDS currentFolder;
  final SubFolderAndModuleProvider subFmPr;

  const OneFolderListItem(
      {super.key, required this.currentFolder, required this.fmPr, required this.subFmPr});

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
              currentFolder.name,
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
      onTap: () async {
        fmPr.currentFolder = currentFolder;
        // subFmPr.reInit();
      },
    );
  }
}

class OneModuleListItem extends StatelessWidget {
  final FolderAndModuleProvider fmPr;
  final ModuleDbDS currentModule;
  final SubFolderAndModuleProvider subFmPr;

  const OneModuleListItem(
      {super.key, required this.currentModule, required this.fmPr, required this.subFmPr});

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
              currentModule.name,
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
      onTap: () async {
        fmPr.currentModule = currentModule;
        // subFmPr.reInit();
      },
    );
  }
}
