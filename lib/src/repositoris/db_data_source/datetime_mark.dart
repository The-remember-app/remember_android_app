import 'package:enum_to_string/enum_to_string.dart';
import 'package:isar/isar.dart';
import 'package:the_remember/src/repositoris/db_data_source/term.dart';

import '../../../api_package/lib/api_package.dart';
import '../../urils/db/abstract_entity.dart';

part 'datetime_mark.g.dart';

enum WatchLearnTypeEnum {
  choice,
  reverse_choice,
  write,
  reverse_write,

}


//@collection
@embedded
class LearnTermDatetimeMark extends  AbstractEntity
{
  // get isarId => fastHash(id!);
  // @Name("id")
  // @Index()
  // Id get isarId => AbstractEntity.fastHash(uuid);

  // @Index(unique: true, replace: true, caseSensitive: false)
  late String uuid;

  @Name("user_uuid")
  late String userUuid;

  @Name("term_id")
  late String termUuid;

  // @Name("complex_index")
  // @Index(unique: true, replace: true, caseSensitive: false)
  // List<String> get complexIndex => [uuid, userUuid];

  @Name("start_watch")
  late DateTime startWatch;
  @Name("end_watch")
  late DateTime endWatch;
  @Name("is_learnt")
  late bool isLearnt;
  @Name("is_learn_iter_start")
  late bool isLearnIterStart;

  @Name("watch_type")
  @Enumerated(EnumType.name)
  late WatchLearnTypeEnum watchType;


  @Name("created_at")
  late DateTime createdAt;
  @Name("updated_at")
  late DateTime updatedAt;


// Folder.genId(name) : this(Uuid(), name);
//
// Folder(this.id, this.name);

  // static LearnTermDatetimeMark fromJson(
  //     LearnTermDatetimeMarkDTO data, String userId) {
  //   return LearnTermDatetimeMark()
  //     ..uuid = data.id!.asString
  //     ..userUuid = userId
  //     ..termUuid = data.termId!.asString
  //     ..startWatch = DateTime.parse( data.startWatch?.asString)
  //     ..endWatch =  DateTime.parse(data.endWatch?.asString)
  //     ..isLearnt = data.dialectOrArea?.asBool
  //     ..isLearnIterStart = data.parentAddInfoId?.asBool
  //     ..watchType =  EnumToString.fromString(
  //         WatchLearnTypeEnum.values, data.watchType!.asString)
  //
  //     ..createdAt = DateTime.parse(data.createdAt!.asString)
  //     ..updatedAt = DateTime.parse(data.updatedAt!.asString);
  // }
}
