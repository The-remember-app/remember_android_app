import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:the_remember/api_package/lib/api_package.dart';
import 'package:the_remember/src/repositoris/db_data_source/module.dart';
import 'package:the_remember/src/repositoris/db_data_source/term.dart';

import '../src/repositoris/db_data_source/folder.dart';
import '../src/urils/db/dbMixins.dart';
import '../src/urils/db/engine.dart';

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

Future<void> networkProcessor() async {
  final Dio dio = Dio(BaseOptions(baseUrl: 'http://192.168.0.105:10010'));
  final ApiPackage authApi =
      ApiPackage(dio: dio, serializers: standardSerializers);
  final DefaultApi mainApi = authApi.getDefaultApi();
  // JsonObject("string");
  final authData = await mainApi.loginForAccessTokenAuthTokenPost(
      username: JsonObject("string"), password: JsonObject("string"));
  authApi.setBearerAuth("main_api_key", authData.data!.accessToken!.asString);
  var authHeaders = {
    "Authorization": "Bearer ${authData.data!.accessToken!.asString}"
  };
  // authApi.setApiKey("main_api_key", authData.data!.accessToken!.asString);
  if (kDebugMode) {
    print(authData.data);
  }

  final foldersCoro = mainApi.getAllFoldersFolderAllGet(headers: authHeaders);
  final modulesCoro = mainApi.getAllModuleModuleAllGet(headers: authHeaders);
  final termsCoro = mainApi.getAllTermTermAllGet(headers: authHeaders);

  foldersCoro.whenComplete(() async {
    final folders = await foldersCoro;

    // const _type = FullType(FolderDTO);
    var test = standardSerializers.deserialize(
      folders.data!.asList[0],
      specifiedType: const FullType(FolderDTO),
    ) as FolderDTO;
    // standardSerializers.serialize(, specifiedType: _type);

    // FolderDTO.serializer.

    // var test = FolderDTO.serializer.deserialize(standardSerializers, folders.data!.asList[0]);
    var foldersToDb = {
      for(var ent in
      [for (var folder in folders.data!.asList)
        FolderDbDS.fromJson(standardSerializers.deserialize(folder,
            specifiedType: const FullType(FolderDTO)) as FolderDTO)])
        ent.uuid: ent
    };
    for(var ent in foldersToDb.values){
      if (ent.rootFolderUuid != null){
        ent.rootFolder.value = foldersToDb[ent.rootFolderUuid]!;
      }
    }

    final modules = await modulesCoro;
    var modulesToDb = {
    for(var ent in [
      for (var module in modules.data!.asList)
        ModuleDbDS.fromJson(
            standardSerializers.deserialize(module,
            specifiedType: const FullType(PersonalizeModuleDTO)) as PersonalizeModuleDTO
        )
    ])
      ent.uuid: ent..rootFolder.value = foldersToDb[ent.rootFolderUuid]
    };

    final terms = await termsCoro;
    var termsToDb = [
      for (var term in terms.data!.asList) TermEntityDbDS.fromJson(
          standardSerializers.deserialize(term,
          specifiedType: const FullType(PersonalizeTermDTO)) as PersonalizeTermDTO
      )
    ];
    for(var t in termsToDb){
        t.module.value = modulesToDb[t.moduleUuid]!;
    }

    var conn = (await OpenAndClose3.openConnStatic([
      CollectionSchema<FolderDbDS>,
      CollectionSchema<ModuleDbDS>,
      CollectionSchema<TermEntityDbDS>,
    ]));

    conn[ConnType.term]!.writeTxnSync(() {
       conn[ConnType.term]!.collection<FolderDbDS>().putAllSync(foldersToDb.values.toList());
       conn[ConnType.term]!.collection<ModuleDbDS>().putAllSync(modulesToDb.values.toList());
       conn[ConnType.term]!
          .collection<TermEntityDbDS>()
          .putAllSync(termsToDb);
    });
    var res1 = conn[ConnType.term]!
        .collection<FolderDbDS>()
        .filter()
        .rootFolderIsNull()
        .findAllSync();
    print(res1);

    await OpenAndClose3.closeConnStatic(conn);
  });

  // final folders = await mainApi.getAllFoldersFolderAllGet(headers: authHeaders);

  final modules = await mainApi.getAllModuleModuleAllGet(headers: authHeaders);

  final terms = await mainApi.getAllTermTermAllGet(headers: authHeaders);
}
