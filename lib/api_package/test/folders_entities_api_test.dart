import 'package:test/test.dart';
import 'package:api_package/api_package.dart';


/// tests for FoldersEntitiesApi
void main() {
  final instance = ApiPackage().getFoldersEntitiesApi();

  group(FoldersEntitiesApi, () {
    // Create Folder As Tree
    //
    //Future<JsonObject> createFolderAsTreeFolderCreateAsTreePost(JsonObject body) async
    test('test createFolderAsTreeFolderCreateAsTreePost', () async {
      // TODO
    });

    // Create Folder
    //
    //Future<FolderDTO> createFolderFolderCreatePost(CreateFolderDTO createFolderDTO) async
    test('test createFolderFolderCreatePost', () async {
      // TODO
    });

    // Get All Folders As Tree
    //
    //Future<JsonObject> getAllFoldersAsTreeFolderAllAsTreeGet() async
    test('test getAllFoldersAsTreeFolderAllAsTreeGet', () async {
      // TODO
    });

    // Get All Folders
    //
    //Future<JsonObject> getAllFoldersFolderAllGet() async
    test('test getAllFoldersFolderAllGet', () async {
      // TODO
    });

    // Get One Folder As Tree
    //
    //Future<FolderWithNestedEntitiesDTO> getOneFolderAsTreeFolderFolderIdAsTreeGet(JsonObject folderId) async
    test('test getOneFolderAsTreeFolderFolderIdAsTreeGet', () async {
      // TODO
    });

    // Get One Folder
    //
    //Future<FolderDTO> getOneFolderFolderFolderIdGet(JsonObject folderId) async
    test('test getOneFolderFolderFolderIdGet', () async {
      // TODO
    });

    // Get One Folder With Parents
    //
    //Future<FolderWithRootEntityDTO> getOneFolderWithParentsFolderFolderIdWithParentGet(JsonObject folderId) async
    test('test getOneFolderWithParentsFolderFolderIdWithParentGet', () async {
      // TODO
    });

  });
}
