import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

import '../../../api_package/lib/api_package.dart';
import '../../urils/db/abstract_entity.dart';
import 'module.dart';

part 'user.g.dart';

@collection
class UserDbDS extends AbstractEntity {
  // get isarId => fastHash(id!);
  @Name("id")
  Id get isarId => AbstractEntity.fastHash(uuid) ;
  @Index(unique: true, replace: true, caseSensitive: false)
  late String uuid;
  @Index(unique: true)
  late String username;
  late String password;
  @Index(unique: true)
  late String email;
  late String name;
  late String surname;
  @Name("created_at")
  late DateTime createdAt;
  @Name("updated_at")
  late DateTime updatedAt;
  late bool active = false;


// Folder.genId(name) : this(Uuid(), name);
//
// Folder(this.id, this.name);

  static UserDbDS fromJson(UserDTO data, String password, bool active){

    return UserDbDS()
      ..uuid=data.id!.asString
      ..username=data.id!.asString
      ..password=password
      ..email=data.id!.asString
      ..name=data.id!.asString
      ..surname=data.id!.asString
      ..createdAt=DateTime.parse(data.createdAt!.asString)
      ..updatedAt=DateTime.parse(data.updatedAt!.asString)
      ..active=active
    ;
  }
}
