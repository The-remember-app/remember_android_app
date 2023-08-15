import 'package:test/test.dart';
import 'package:api_package/api_package.dart';


/// tests for AuthApi
void main() {
  final instance = ApiPackage().getAuthApi();

  group(AuthApi, () {
    // Login For Access Token
    //
    //Future<Token> loginForAccessTokenAuthTokenPost(JsonObject username, JsonObject password, { JsonObject grantType, JsonObject scope, JsonObject clientId, JsonObject clientSecret }) async
    test('test loginForAccessTokenAuthTokenPost', () async {
      // TODO
    });

  });
}
