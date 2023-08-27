

import 'package:isar/isar.dart';

import '../../../api_package/lib/api_package.dart';
import '../../urils/db/abstract_entity.dart';
import 'folder.dart';
import 'term.dart';

part 'module.g.dart';




  // Module.genId(name) : this(Uuid(), name);
  //
  // Module(this.id, this.name);

@collection
class ModuleDbDS  extends AbstractEntity {
  @Name("id")
  Id get isarId => AbstractEntity.fastHash(complexIndex.join("")) ;
  late String uuid;
  @Name("user_uuid")
  late String userUuid;
  @Name("complex_index")
  @Index(unique: true, replace: true, caseSensitive: false)
  List<String> get complexIndex => [uuid, userUuid];
  late String name;
  @Name("root_folder_uuid")
  late String? rootFolderUuid;

  @Name("is_reverse_definition_write")
  late bool isReverseDefinitionWrite = false;
  @Name("standard_and_reverse_write")
  late bool standardAndReverseWrite = true;
  @Name("is_reverse_definition_choice")
  late bool isReverseDefinitionChoice = false;
  @Name("standard_and_reverse_choice")
  late bool standardAndReverseChoice = true;

  @Name("max_iteration_len")
  late int maxIterationLen = 10;
  @Name("min_iteration_len")
  late int minIterationLen = 4;
  @Name("min_watch_count")
  late int minWatchCount = 5;
  @Name("known_term_part")
  late int knownTermPart = 30;
  @Name("choices_count")
  late int choicesCount = 4;

  @Name("created_at")
  late DateTime createdAt;
  @Name("updated_at")
  late DateTime updatedAt;
  @Name("personal_created_at")
  late DateTime personalCreatedAt;
  @Name("personal_updated_at")
  late DateTime personalUpdatedAt;

  @Backlink(to: 'module')
  final words = IsarLinks<TermEntityDbDS>();
  @Name("root_folder")
  final rootFolder = IsarLink<FolderDbDS>();

  static ModuleDbDS fromJson(PersonalizeModuleDTO data){

    return ModuleDbDS()
      ..uuid=data.id!.asString
      ..userUuid=data.userId!.asString
      ..name=data.name!.asString
      ..rootFolderUuid=data.rootFolderId?.asString
      ..isReverseDefinitionWrite=data.isReverseDefinitionWrite!.asBool
      ..standardAndReverseWrite=data.standardAndReverseWrite!.asBool
      ..isReverseDefinitionChoice=data.isReverseDefinitionChoice!.asBool
      ..standardAndReverseChoice=data.standardAndReverseChoice!.asBool
      ..createdAt=DateTime.parse(data.createdAt!.asString)
      ..updatedAt=DateTime.parse(data.updatedAt!.asString)
      ..personalCreatedAt=DateTime.parse(data.personalCreatedAt!.asString)
      ..personalUpdatedAt=DateTime.parse(data.personalUpdatedAt!.asString)
    ;
  }
}
