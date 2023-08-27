import 'package:api_package/api_package.dart';
import 'package:test/test.dart';


/// tests for TermEntitiesApi
void main() {
  final instance = ApiPackage().getTermEntitiesApi();

  group(TermEntitiesApi, () {
    // Create Term
    //
    //Future<TermDTO> createTermTermCreatePost(CreateTermDTO createTermDTO) async
    test('test createTermTermCreatePost', () async {
      // TODO
    });

    // Get All Term
    //
    //Future<JsonObject> getAllTermTermAllGet() async
    test('test getAllTermTermAllGet', () async {
      // TODO
    });

    // Get One Term
    //
    //Future<PersonalizeTermDTO> getOneTermTermTermIdGet(JsonObject termId) async
    test('test getOneTermTermTermIdGet', () async {
      // TODO
    });

  });
}
