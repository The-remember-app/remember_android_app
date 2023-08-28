

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../domain_layer/providers/main/folders/folder_progress_bar.dart';
import '../../../repositoris/db_data_source/folder.dart';
import '../../pages/modules/folder_status_bar.dart';
import '../../ui_templates/abstract_ui.dart';

class FolderStatusBarAddConsumer extends StatelessWidget{
  final FolderOrModule currEntity;

  const FolderStatusBarAddConsumer(this.currEntity);


  @override
  Widget build(BuildContext context) {
    return Consumer<FolderProgressBarProvider>(
        builder: (context, fStPr, child) {
          return AwaitFolderStatusBar(
                  (BuildContext) async =>  fStPr.getFolderOrModuleStats(currEntity)
          );
        });
  }
}

class AwaitFolderStatusBar extends StatefulWidget {
  bool userGetterCompleted = false;
  late Future Function(BuildContext) awaitTermsStateFunc;

  AwaitFolderStatusBar(this.awaitTermsStateFunc) : super(){  }

  @override
  _AwaitFolderStatusBarState createState() => _AwaitFolderStatusBarState();
}


class _AwaitFolderStatusBarState extends AbstractUIStatefulWidget<AwaitFolderStatusBar>{

  _AwaitFolderStatusBarState(): super();

  @override
  Widget build(BuildContext context){
    var _future = widget.awaitTermsStateFunc(context);
    FolderStats? res = null;
    return FutureBuilder<FolderStats>(
          future: _future.then((value) async => res=value),
          builder: (context, AsyncSnapshot<FolderStats> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.error != null) {
                return Text(snapshot.error.toString());
              }
              return CircleFolderStatusBarWidget(res!);

            } else {
              return Container();
            }
          },
          // )
        );

  }
}
