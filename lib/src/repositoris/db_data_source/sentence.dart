import 'package:enum_to_string/enum_to_string.dart';
import 'package:isar/isar.dart';
import 'package:the_remember/src/repositoris/db_data_source/term.dart';
import 'package:uuid/uuid.dart';

import '../../../api_package/lib/api_package.dart';
import '../../urils/db/abstract_entity.dart';


part 'sentence.g.dart';


@collection
class SentenceDbDS extends AbstractEntity {
  // get isarId => fastHash(id!);
  @Name("id")
  Id get isarId => AbstractEntity.fastHash(complexIndex.join(""));

  late String uuid;
  @Name("user_uuid")
  late String userUuid;

  @Name("complex_index")
  @Index(unique: true, replace: true, caseSensitive: false)
  List<String> get complexIndex => [uuid, userUuid];

  @Name("sentence")
  late String? sentence;
  @Name("translate")
  late String? translate;


  @Name("term_id")
  late String termUuid;

  @Name("created_at")
  late DateTime createdAt;
  @Name("updated_at")
  late DateTime updatedAt;

  @Name("term_entity")
  final termEntity = IsarLink<TermEntityDbDS>();

  static SentenceDbDS fromJson(SentenceDTO data, String userId) {
    return SentenceDbDS()
      ..uuid = data.id!.asString
      ..userUuid = userId
      ..sentence = data.sentence!.asString
      ..translate = data.translate!.asString
      ..termUuid = data.termId!.asString
      ..createdAt = DateTime.parse(data.createdAt!.asString)
      ..updatedAt = DateTime.parse(data.updatedAt!.asString);
  }
}
