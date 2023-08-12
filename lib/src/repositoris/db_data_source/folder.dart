import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

import '../../../api_package/lib/api_package.dart';
import '../../urils/db/abstract_entity.dart';
import 'module.dart';

part 'folder.g.dart';

@collection
class FolderDbDS extends AbstractEntity {
  // get isarId => fastHash(id!);
  @Name("id")
  Id get isarId => AbstractEntity.fastHash(uuid) ;
  @Index(unique: true, replace: true, caseSensitive: false)
  late String uuid;
  late String name;
  @Name("root_folder_uuid")
  late String? rootFolderUuid = null;

  @Backlink(to: 'rootFolder')
  final modules = IsarLinks<ModuleDbDS>();
  @Backlink(to: 'rootFolder')
  final folders = IsarLinks<FolderDbDS>();
  @Name("root_folder")
  final rootFolder = IsarLink<FolderDbDS>();

// Folder.genId(name) : this(Uuid(), name);
//
// Folder(this.id, this.name);

  static FolderDbDS fromJson(FolderDTO data){

    return FolderDbDS()
      ..uuid=data.id!.asString
      ..name=data.name!.asString
      ..rootFolderUuid=data.rootFolderId?.asString
    ;
  }
}




