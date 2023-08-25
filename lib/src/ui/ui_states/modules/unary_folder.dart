

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain_layer/providers/folder_module.dart';
import '../../../domain_layer/providers/sub_folder_modules.dart';
import '../../pages/modules/unary_folder.dart';
import '../../ui_templates/abstract_ui.dart';

class FoldersListProcessor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var fmPr = Provider.of<FolderAndModuleProvider>(context, listen: false);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SubFolderAndModuleProvider(fmPr: fmPr)),
      ],
      child: AwaitFoldersList(),
    );
  }

}

class AwaitFoldersList extends StatefulWidget{
  @override
  _AwaitFoldersListState createState() => _AwaitFoldersListState();
}

class _AwaitFoldersListState extends AbstractUIStatefulWidget<AwaitFoldersList>
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<SubFolderAndModuleProvider>(builder: (context, subFmPr, child) {
      var _future = subFmPr.initLists;
      return FutureBuilder<void>(
        future: _future.then((value) async {
          return value;
        }),
        builder: (context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.error != null) {
              return Text(snapshot.error.toString());
            }
            return LoadedFoldersList();

          } else {
            return Container();

          }
        },
        // )
      );
    });
  }
}

