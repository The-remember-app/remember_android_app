import 'package:isar/isar.dart';

import '../../../api_package/lib/api_package.dart';
import '../../urils/db/abstract_entity.dart';
import 'module.dart';

part 'folder.g.dart';


abstract class FolderOrModule extends AbstractEntity {
  Id get isarId;
  late String uuid;
  late String userUuid;
  late String? rootFolderUuid;
}

@collection
class FolderDbDS extends AbstractEntity implements FolderOrModule {
  // get isarId => fastHash(id!);
  @Name("id")
  Id get isarId => AbstractEntity.fastHash(complexIndex.join("")) ;
  // @Index(unique: true, replace: true, caseSensitive: false)
  late String uuid;
  @Name("user_uuid")
  late String userUuid;
  @Name("complex_index")
  @Index(unique: true, replace: true, caseSensitive: false)
  List<String> get complexIndex => [uuid, userUuid];

  late String name;

  @Name("author_uuid")
  late String? authorUuid;
  // @Name("user_uuid")
  // late String userUuid;


  @Name("root_folder_uuid")
  late String? rootFolderUuid = null;

  @Name("created_at")
  late DateTime createdAt;
  @Name("updated_at")
  late DateTime updatedAt;
  @Name("personal_created_at")
  late DateTime personalCreatedAt;
  @Name("personal_updated_at")
  late DateTime personalUpdatedAt;

  @Backlink(to: 'rootFolder')
  final modules = IsarLinks<ModuleDbDS>();
  @Backlink(to: 'rootFolder')
  final folders = IsarLinks<FolderDbDS>();
  @Name("root_folder")
  final rootFolder = IsarLink<FolderDbDS>();

// Folder.genId(name) : this(Uuid(), name);
//
// Folder(this.id, this.name);

  static FolderDbDS fromJson(PersonalizeFolderDTO data){

    return FolderDbDS()
      ..uuid=data.id!.asString
      ..name=data.name!.asString
      ..rootFolderUuid=data.rootFolderId?.asString
      ..authorUuid=data.authorId?.asString
      ..userUuid=data.userId!.asString
      ..createdAt=DateTime.parse(data.createdAt!.asString)
      ..updatedAt=DateTime.parse(data.updatedAt!.asString)
      ..personalCreatedAt=DateTime.parse(data.personalCreatedAt!.asString)
      ..personalUpdatedAt=DateTime.parse(data.personalUpdatedAt!.asString)
    ;
  }

}




