//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:dio/dio.dart';
import 'package:built_value/serializer.dart';
import 'package:api_package/src/serializers.dart';
import 'package:api_package/src/auth/api_key_auth.dart';
import 'package:api_package/src/auth/basic_auth.dart';
import 'package:api_package/src/auth/bearer_auth.dart';
import 'package:api_package/src/auth/oauth.dart';
import 'package:api_package/src/api/additional_info_of_terms_api.dart';
import 'package:api_package/src/api/auth_api.dart';
import 'package:api_package/src/api/folders_entities_api.dart';
import 'package:api_package/src/api/module_entities_api.dart';
import 'package:api_package/src/api/sentence_entities_api.dart';
import 'package:api_package/src/api/term_entities_api.dart';
import 'package:api_package/src/api/term_marks_entities_api.dart';
import 'package:api_package/src/api/users_entities_api.dart';

class ApiPackage {
  static const String basePath = r'http://localhost';

  final Dio dio;
  final Serializers serializers;

  ApiPackage({
    Dio? dio,
    Serializers? serializers,
    String? basePathOverride,
    List<Interceptor>? interceptors,
  })  : this.serializers = serializers ?? standardSerializers,
        this.dio = dio ??
            Dio(BaseOptions(
              baseUrl: basePathOverride ?? basePath,
              connectTimeout: const Duration(milliseconds: 5000),
              receiveTimeout: const Duration(milliseconds: 3000),
            )) {
    if (interceptors == null) {
      this.dio.interceptors.addAll([
        OAuthInterceptor(),
        BasicAuthInterceptor(),
        BearerAuthInterceptor(),
        ApiKeyAuthInterceptor(),
      ]);
    } else {
      this.dio.interceptors.addAll(interceptors);
    }
  }

  void setOAuthToken(String name, String token) {
    if (this.dio.interceptors.any((i) => i is OAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is OAuthInterceptor) as OAuthInterceptor).tokens[name] = token;
    }
  }

  void setBearerAuth(String name, String token) {
    if (this.dio.interceptors.any((i) => i is BearerAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BearerAuthInterceptor) as BearerAuthInterceptor).tokens[name] = token;
    }
  }

  void setBasicAuth(String name, String username, String password) {
    if (this.dio.interceptors.any((i) => i is BasicAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BasicAuthInterceptor) as BasicAuthInterceptor).authInfo[name] = BasicAuthInfo(username, password);
    }
  }

  void setApiKey(String name, String apiKey) {
    if (this.dio.interceptors.any((i) => i is ApiKeyAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((element) => element is ApiKeyAuthInterceptor) as ApiKeyAuthInterceptor).apiKeys[name] = apiKey;
    }
  }

  /// Get AdditionalInfoOfTermsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  AdditionalInfoOfTermsApi getAdditionalInfoOfTermsApi() {
    return AdditionalInfoOfTermsApi(dio, serializers);
  }

  /// Get AuthApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  AuthApi getAuthApi() {
    return AuthApi(dio, serializers);
  }

  /// Get FoldersEntitiesApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  FoldersEntitiesApi getFoldersEntitiesApi() {
    return FoldersEntitiesApi(dio, serializers);
  }

  /// Get ModuleEntitiesApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  ModuleEntitiesApi getModuleEntitiesApi() {
    return ModuleEntitiesApi(dio, serializers);
  }

  /// Get SentenceEntitiesApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  SentenceEntitiesApi getSentenceEntitiesApi() {
    return SentenceEntitiesApi(dio, serializers);
  }

  /// Get TermEntitiesApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  TermEntitiesApi getTermEntitiesApi() {
    return TermEntitiesApi(dio, serializers);
  }

  /// Get TermMarksEntitiesApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  TermMarksEntitiesApi getTermMarksEntitiesApi() {
    return TermMarksEntitiesApi(dio, serializers);
  }

  /// Get UsersEntitiesApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  UsersEntitiesApi getUsersEntitiesApi() {
    return UsersEntitiesApi(dio, serializers);
  }
}
