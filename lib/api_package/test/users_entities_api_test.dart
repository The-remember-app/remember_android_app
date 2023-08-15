import 'package:test/test.dart';
import 'package:api_package/api_package.dart';


/// tests for UsersEntitiesApi
void main() {
  final instance = ApiPackage().getUsersEntitiesApi();

  group(UsersEntitiesApi, () {
    // Create User
    //
    //Future<UserDTO> createUserUserCreatePost(CreateUserDTO createUserDTO) async
    test('test createUserUserCreatePost', () async {
      // TODO
    });

    // Read Users Me
    //
    //Future<UserDTO> readUsersMeUserMeGet() async
    test('test readUsersMeUserMeGet', () async {
      // TODO
    });

  });
}
