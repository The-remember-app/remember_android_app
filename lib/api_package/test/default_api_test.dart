import 'package:api_package/api_package.dart';
import 'package:test/test.dart';


/// tests for DefaultApi
void main() {
  final instance = ApiPackage().getDefaultApi();

  group(DefaultApi, () {
    // Create Folder
    //
    //Future<FolderDTO> createFolderFolderCreatePost(CreateFolderDTO createFolderDTO) async
    test('test createFolderFolderCreatePost', () async {
      // TODO
    });

    // Create Folder
    //
    //Future<ModuleDTO> createFolderModuleCreatePost(CreateModuleDTO createModuleDTO) async
    test('test createFolderModuleCreatePost', () async {
      // TODO
    });

    // Create Folder
    //
    //Future<TermDTO> createFolderTermCreatePost(CreateTermDTO createTermDTO) async
    test('test createFolderTermCreatePost', () async {
      // TODO
    });

    // Create User
    //
    //Future<UserDTO> createUserUserCreatePost(CreateUserDTO createUserDTO) async
    test('test createUserUserCreatePost', () async {
      // TODO
    });

    // Get All Folders
    //
    //Future<JsonObject> getAllFoldersFolderAllGet() async
    test('test getAllFoldersFolderAllGet', () async {
      // TODO
    });

    // Get All Folders
    //
    //Future<JsonObject> getAllFoldersModuleAllGet() async
    test('test getAllFoldersModuleAllGet', () async {
      // TODO
    });

    // Get All Folders
    //
    //Future<JsonObject> getAllFoldersTermAllGet() async
    test('test getAllFoldersTermAllGet', () async {
      // TODO
    });

    // Get One Folder
    //
    //Future<FolderDTO> getOneFolderFolderFolderIdGet(JsonObject folderId) async
    test('test getOneFolderFolderFolderIdGet', () async {
      // TODO
    });

    // Get One Folder
    //
    //Future<PersonalizeModuleDTO> getOneFolderModuleModuleIdGet(JsonObject moduleId) async
    test('test getOneFolderModuleModuleIdGet', () async {
      // TODO
    });

    // Get One Folder
    //
    //Future<PersonalizeTermDTO> getOneFolderTermTermIdGet(JsonObject termId) async
    test('test getOneFolderTermTermIdGet', () async {
      // TODO
    });

    // Login For Access Token
    //
    //Future<Token> loginForAccessTokenAuthTokenPost(JsonObject username, JsonObject password, { JsonObject grantType, JsonObject scope, JsonObject clientId, JsonObject clientSecret }) async
    test('test loginForAccessTokenAuthTokenPost', () async {
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
