
import 'package:built_value/json_object.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:the_remember/api_package/lib/api_package.dart';

// Future<FolderDTO> loadPet() async {
//   final Dio dio = Dio(BaseOptions(baseUrl: 'http://192.168.0.105:10010'));
//   final ApiPackage authApi = ApiPackage(dio: dio, serializers:standardSerializers);
//   final DefaultApi mainApi = authApi.getDefaultApi();
//   JsonObject("string");
//   final authData = mainApi.loginForAccessTokenAuthTokenPost(username: JsonObject("string"), password: JsonObject("string"));
//
//   const petId = 9;
//   final Response<Pet> response = await authApi.
//       // .getPetById(petId, headers: <String, String>{'Authorization': 'Bearer special-key'});
//   return response.data;
// }

Future<void> networkProcessor() async{
  final Dio dio = Dio(BaseOptions(baseUrl: 'http://192.168.0.105:10010'));
  final ApiPackage authApi = ApiPackage(dio: dio, serializers:standardSerializers);
  final DefaultApi mainApi = authApi.getDefaultApi();
  // JsonObject("string");
  final authData = await mainApi.loginForAccessTokenAuthTokenPost(username: JsonObject("string"), password: JsonObject("string"));
  if (kDebugMode) {
    print(authData.data);
  }


}