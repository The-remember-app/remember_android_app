import 'package:test/test.dart';
import 'package:api_package/api_package.dart';


/// tests for SentenceEntitiesApi
void main() {
  final instance = ApiPackage().getSentenceEntitiesApi();

  group(SentenceEntitiesApi, () {
    // Create Term
    //
    //Future<SentenceDTO> createTermSentenceCreatePost(CreateSentenceDTO createSentenceDTO) async
    test('test createTermSentenceCreatePost', () async {
      // TODO
    });

    // Get All Term
    //
    //Future<JsonObject> getAllTermSentenceAllGet() async
    test('test getAllTermSentenceAllGet', () async {
      // TODO
    });

    // Get One Term
    //
    //Future<SentenceDTO> getOneTermSentenceSentenceIdGet(JsonObject sentenceId) async
    test('test getOneTermSentenceSentenceIdGet', () async {
      // TODO
    });

  });
}
