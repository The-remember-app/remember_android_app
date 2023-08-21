import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

import '../../../api_package/lib/api_package.dart';
import '../../urils/db/abstract_entity.dart';
import 'module.dart';

part 'http_utils.g.dart';

@collection
class HttpUtilsDbDS extends AbstractEntity {
  // get isarId => fastHash(id!);
  @Name("id")
  late Id isarId;
  @Index(unique: true, replace: true, caseSensitive: false)
  @Name("http_url")
  late String httpUrl;


// Folder.genId(name) : this(Uuid(), name);
//
// Folder(this.id, this.name);

}
