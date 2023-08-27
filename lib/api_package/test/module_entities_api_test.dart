import 'package:api_package/api_package.dart';
import 'package:test/test.dart';


/// tests for ModuleEntitiesApi
void main() {
  final instance = ApiPackage().getModuleEntitiesApi();

  group(ModuleEntitiesApi, () {
    // Create Module
    //
    //Future<ModuleDTO> createModuleModuleCreatePost(CreateModuleDTO createModuleDTO) async
    test('test createModuleModuleCreatePost', () async {
      // TODO
    });

    // Get All Module
    //
    //Future<JsonObject> getAllModuleModuleAllGet() async
    test('test getAllModuleModuleAllGet', () async {
      // TODO
    });

    // Get One Module
    //
    //Future<PersonalizeModuleDTO> getOneModuleModuleModuleIdGet(JsonObject moduleId) async
    test('test getOneModuleModuleModuleIdGet', () async {
      // TODO
    });

  });
}
