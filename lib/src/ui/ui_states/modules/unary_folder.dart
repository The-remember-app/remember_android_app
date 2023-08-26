

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain_layer/providers/folder_module.dart';
import '../../../domain_layer/providers/sub_folder_modules.dart';
import '../../pages/modules/unary_folder.dart';
import '../../ui_templates/abstract_ui.dart';

class FoldersListProcessor extends StatefulWidget {
  final DFMapper dfMapper;

  const FoldersListProcessor({super.key, required this.dfMapper});

  @override
  _FoldersListProcessorState createState() => _FoldersListProcessorState();



}
class _FoldersListProcessorState extends AbstractUIStatefulWidget<FoldersListProcessor>{
  @override
  Widget build(BuildContext context) {
    var fmPr = Provider.of<FolderAndModuleProvider>(context, listen: false);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SubFolderAndModuleProvider(widget.dfMapper, fmPr: fmPr)),
      ],
      child: AwaitFoldersList( dfMapper: widget.dfMapper),
    );
  }
}


class AwaitFoldersList extends StatefulWidget{
  final DFMapper dfMapper;

  const AwaitFoldersList({super.key, required this.dfMapper});

  @override
  _AwaitFoldersListState createState() => _AwaitFoldersListState();
}

class _AwaitFoldersListState extends AbstractUIStatefulWidget<AwaitFoldersList>
{
  @override
  Widget build(BuildContext context) {

    return Consumer<SubFolderAndModuleProvider>(builder: (context, subFmPr, child) {
      // subFmPr.reInit();
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
            return LoadedFoldersList( dfMapper: widget.dfMapper);

          } else {
            return Container();

          }
        },
        // )
      );
    });
  }
}

