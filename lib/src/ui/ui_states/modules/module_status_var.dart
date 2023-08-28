import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:the_remember/src/repositoris/db_data_source/module.dart';

import '../../../domain_layer/providers/main/folders/folder_progress_bar.dart';
import '../../../domain_layer/providers/main/folders/module/terms_in_module.dart';
import 'folder_status_bar.dart';



class AwaitTermsInMainModule extends StatelessWidget{
  final ModuleDbDS currEntity;

  const AwaitTermsInMainModule(this.currEntity);


  @override
  Widget build(BuildContext context) {
    return Consumer<TermsInModuleProvider>(
        builder: (context, termsPr, child) {
          return AwaitFolderStatusBar(
                  (BuildContext) async {
                    await termsPr.initLists;
                    var res = ModuleDbDS.getLearnProcessStatic(termsPr.termsList!);
                    return FolderStats(res.$1, res.$2, res.$3, res.$4, );
                  }
          );
        });
  }
}