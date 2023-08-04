///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../models/folder.dart';
import 'modules.dart';

class UnaryFolder extends StatelessWidget {
  final Uuid folderId;

  UnaryFolder(this.folderId);

  @override
  Widget build(BuildContext context) {
    final folder = foldersOrModules[folderId];
    Map<Uuid, AbstractFolder> data = {
      for (var v in folderTree[folderId] ?? []) v.id: v
    };

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
          folder?.name ?? "Не найдено ничего по этому UUID",
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
            children: data.entries.map<Widget>((KeyValPair) {
              final (id, folder_or_module) = (KeyValPair.key, KeyValPair.value);
              return folder_or_module is Folder
                  ? getFolder(folder_or_module, context)
                  : getModule(folder_or_module, context);
            }).toList(),
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
