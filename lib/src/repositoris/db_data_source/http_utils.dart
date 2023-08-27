import 'package:isar/isar.dart';

import '../../urils/db/abstract_entity.dart';

part 'http_utils.g.dart';

@collection
class HttpUtilsDbDS extends AbstractEntity {
  // get isarId => fastHash(id!);
  @Name("id")
  Id get isarId => AbstractEntity.fastHash(httpUrl) ;
  @Index(unique: true, replace: true, caseSensitive: false)
  @Name("http_url")
  late String httpUrl;


// Folder.genId(name) : this(Uuid(), name);
//
// Folder(this.id, this.name);

}
