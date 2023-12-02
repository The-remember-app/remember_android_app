

import 'package:built_value/json_object.dart';
import 'package:dio/dio.dart';

import '../network_errors.dart';
import 'main.dart';

extension AuthUnaryUrlControllerExt on UnaryUrlController {

  Future<Map<String, String>> auth(String username, String password) async {
    var ans = await healthCheckFuture!;
    if (UnaryUrlController.testConnection(ans)){
      authApi ??= apiContainersContainer.getAuthApi();
      authFuture = getAuthHeaders(username, password);
      return authFuture!;
    }
    throw ServerUrlIsUnavailable();
  }

  Future<Map<String, String>> getAuthHeaders(String username, String password) async {

    var authData = await webProtocolDecorator(authApi.loginForAccessTokenTokenPost(
        username: JsonObject(username), password: JsonObject(password)
    ));
    if (authData?.statusCode == 200) {
      var authHeaders = {
        "Authorization": "Bearer ${authData?.data!.accessToken!.asString}"
      };
      return authHeaders;
    }
    else if  (authData?.statusCode == 401) {
      throw AuthErrorUserPasswordNotCorrect(url, username, password);
    }
    throw ServerUrlIsUnavailable();
  }



}