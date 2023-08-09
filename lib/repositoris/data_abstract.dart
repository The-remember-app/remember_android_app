


import 'package:uuid/uuid.dart';

import 'folder_repository/local_db_data_source/folder.dart';
import 'module_repository/local_db_data_source/module.dart';

abstract class AbstractFolder {

  static  (Map<Uuid, AbstractFolder>, Map<Uuid,  List<AbstractFolder>>) getFolders() {
    final List<AbstractFolder> folders = [
      // Folder.genId("папка 1"),
      // Folder.genId("папка 2"),
      // Folder.genId("папка 3"),
      // Module.genId("Модуль 1")
    ];
    Map<Uuid, AbstractFolder> foldersOrModules = Map<Uuid, AbstractFolder>();
    // {
    //   for (var v in folders)  v.id: v
    // };
    final Map<Uuid, List<AbstractFolder>> folderTree = Map<Uuid, List<AbstractFolder>>();
    // {
    //   for (var v in folders)
    //     if (v is Folder)
    //       v.id: [
    //         for (int i = 1; i < 5; i++)
    //           i < 3
    //               ? Folder.genId("folder-${v.name}-${i}")
    //               : Module.genId("folder-${v.name}-${i}")
    //       ]
    // };
    // folderTree.map( =>  MapEntry(key, value));
    // for (var v in folderTree.entries) {
    //   var (key, value) = (v.key, v.value);
    //   for (var e in value) {
    //     foldersOrModules[e.id] = e;
    //   }
    // }
    //   var data = folderTree.map((key, value) {
    //
    //     value.map((e)  {
    //       foldersOrModules[e.id] = e;
    //       return e;
    //     });
    //     return MapEntry(key, value);
    //   });
    //   return (foldersOrModules, folderTree);
    // }
    return (foldersOrModules, folderTree);
  }

}

// var someData = AbstractFolder.getFolders();
// var foldersOrModules = someData.$1;
// var folderTree = someData.$2;