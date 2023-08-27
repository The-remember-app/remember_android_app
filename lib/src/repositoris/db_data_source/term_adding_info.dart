import 'package:enum_to_string/enum_to_string.dart';
import 'package:isar/isar.dart';
import 'package:the_remember/src/repositoris/db_data_source/term.dart';

import '../../../api_package/lib/api_package.dart';
import '../../urils/db/abstract_entity.dart';

part 'term_adding_info.g.dart';

enum AddInfoType {
  usual_term,
  other_form,
  help_phrase_with_word,
  help_phrase_without_word,
  abbreviation,
  composite_word,
  sound,
  transcription,
}

@collection
class TermAddingInfoDbDS extends AbstractEntity {
  // get isarId => fastHash(id!);
  @Name("id")
  Id get isarId => AbstractEntity.fastHash(complexIndex.join(""));

  // @Index(unique: true, replace: true, caseSensitive: false)
  late String uuid;
  @Name("user_uuid")
  late String userUuid;

  @Name("complex_index")
  @Index(unique: true, replace: true, caseSensitive: false)
  List<String> get complexIndex => [uuid, userUuid];

  @Name("text_data")
  late String? textData;
  @Name("adding_text_data")
  late String? addingTextData;
  @Name("dialect_or_area")
  late String? dialectOrArea;

  @Name("add_info_type")
  @Enumerated(EnumType.name)
  late AddInfoType? addInfoType;

  @Name("term_id")
  // @Index(unique: false, replace: true, caseSensitive: false)
  late String termUuid;

  @Name("parent_add_info_id")
  late String? parentAddInfoId;

  @Name("created_at")
  late DateTime createdAt;
  @Name("updated_at")
  late DateTime updatedAt;

  @Name("term_entity")
  final termEntity = IsarLink<TermEntityDbDS>();
  @Name("parent_adding_info_entity")
  final parentAddingInfoEntity = IsarLink<TermAddingInfoDbDS>();
  @Backlink(to: 'parentAddingInfoEntity')
  @Name("child_adding_info_entities")
  final childAddInfoEntities = IsarLinks<TermAddingInfoDbDS>();

// Folder.genId(name) : this(Uuid(), name);
//
// Folder(this.id, this.name);

  static TermAddingInfoDbDS fromJson(
      AdditionalTermInfoDTO data, String userId) {
    return TermAddingInfoDbDS()
      ..uuid = data.id!.asString
      ..userUuid = userId
      ..textData = data.textData?.asString
      ..addingTextData = data.addingTextData?.asString
      ..dialectOrArea = data.dialectOrArea?.asString
      ..addInfoType = (null == data.addInfoType)
          ? null
          : EnumToString.fromString(
              AddInfoType.values, data.addInfoType!.asString)
      ..termUuid = data.termId!.asString
      ..parentAddInfoId = data.parentAddInfoId?.asString
      ..createdAt = DateTime.parse(data.createdAt!.asString)
      ..updatedAt = DateTime.parse(data.updatedAt!.asString);
  }
}
