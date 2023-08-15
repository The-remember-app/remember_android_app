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
  final AuthApi realAuthApi = authApi.getAuthApi();
  final authData = await realAuthApi.loginForAccessTokenAuthTokenPost(
      username: JsonObject("1"), password: JsonObject("1"));
  authApi.setBearerAuth("Authorization", "Bearer ${authData.data!.accessToken!.asString}");


  final FoldersEntitiesApi folderApi = authApi.getFoldersEntitiesApi();
  final ModuleEntitiesApi moduleApi = authApi.getModuleEntitiesApi();
  final TermEntitiesApi termApi = authApi.getTermEntitiesApi();
  // JsonObject("string");
  late Map<ConnType, Isar> conn;
  late Map<String, FolderDbDS> foldersFromDb;
  late Map<String, ModuleDbDS> modulesFromDb;
  late Map<String, TermEntityDbDS> termsFromDb;

  var coro = (() async {
    await Future.delayed(Duration(seconds: 5));
    conn = (await OpenAndClose3.openConnStatic([
      CollectionSchema<FolderDbDS>,
      CollectionSchema<ModuleDbDS>,
      CollectionSchema<TermEntityDbDS>,
    ]));

    foldersFromDb = {
      for (var ent in await conn[ConnType.term]!
          .collection<FolderDbDS>()
          .where()
          .findAll())
        ent.uuid: ent
    };
    modulesFromDb = {
      for (var ent in await conn[ConnType.term]!
          .collection<ModuleDbDS>()
          .where()
          .findAll())
        ent.uuid: ent
    };
    termsFromDb = {
      for (var ent in await conn[ConnType.term]!
          .collection<TermEntityDbDS>()
          .where()
          .findAll())
        ent.uuid: ent
    };
  })();


  var authHeaders = {
    "Authorization": "Bearer ${authData.data!.accessToken!.asString}"
  };
  // authApi.setApiKey("main_api_key", authData.data!.accessToken!.asString);
  if (kDebugMode) {
    print(authData.data);
  }

  final foldersCoro = folderApi.getAllFoldersFolderAllGet(headers: authHeaders);
  final modulesCoro = moduleApi.getAllModuleModuleAllGet(headers: authHeaders);
  final termsCoro = termApi.getAllTermTermAllGet(headers: authHeaders);

  final folders = await foldersCoro;

  // const _type = FullType(FolderDTO);
  var test = standardSerializers.deserialize(
    folders.data!.asList[0],
    specifiedType: const FullType(FolderDTO),
  ) as FolderDTO;
  // standardSerializers.serialize(, specifiedType: _type);

  // FolderDTO.serializer.

  // var test = FolderDTO.serializer.deserialize(standardSerializers, folders.data!.asList[0]);
  var res = await coro;
  var foldersToDb = {
    for (var ent in [
      for (var folder in folders.data!.asList)
        FolderDbDS.fromJson(standardSerializers.deserialize(folder,
            specifiedType: const FullType(FolderDTO)) as FolderDTO)
    ])
      ent.uuid: ent
  };
  for (var ent in foldersToDb.values) {
    if (ent.rootFolderUuid != null) {
      ent.rootFolder.value = foldersToDb[ent.rootFolderUuid]!;
    }
  }

  ModuleDbDS moduleTransform(ModuleDbDS networkModule) {
    networkModule.rootFolder.value = foldersToDb[networkModule.rootFolderUuid];
    if (modulesFromDb[networkModule.uuid] != null) {
      var dbModule = modulesFromDb[networkModule.uuid]!;
      if (networkModule.personalUpdatedAt
          .isBefore(dbModule.personalUpdatedAt)) {
        networkModule
          ..isReverseDefinitionWrite = dbModule.isReverseDefinitionWrite
          ..standardAndReverseWrite = dbModule.standardAndReverseWrite
          ..isReverseDefinitionChoice = dbModule.isReverseDefinitionChoice
          ..standardAndReverseChoice = dbModule.standardAndReverseChoice
          ..personalUpdatedAt = dbModule.personalUpdatedAt;
      }
    }
    return networkModule;
  }

  final modules = await modulesCoro;
  var modulesToDb = {
    for (var ent in [
      for (var module in modules.data!.asList)
        ModuleDbDS.fromJson(standardSerializers.deserialize(module,
                specifiedType: const FullType(PersonalizeModuleDTO))
            as PersonalizeModuleDTO)
    ])
      ent.uuid: moduleTransform(ent)
  };

  final terms = await termsCoro;
  var termsToDb = [
    for (var term in terms.data!.asList)
      TermEntityDbDS.fromJson(standardSerializers.deserialize(term,
              specifiedType: const FullType(PersonalizeTermDTO))
          as PersonalizeTermDTO)
  ];
  for (var networkTerm in termsToDb) {
    networkTerm.module.value = modulesToDb[networkTerm.moduleUuid]!;
    if (termsFromDb[networkTerm.uuid] != null) {
      var dbTerm = termsFromDb[networkTerm.uuid]!;
      if (networkTerm.personalUpdatedAt.isBefore(dbTerm.personalUpdatedAt)) {
        networkTerm
          ..chooseErrorCounter = dbTerm.chooseErrorCounter
          ..writeErrorCounter = dbTerm.writeErrorCounter
          ..choisceNegErrorCounter = dbTerm.choisceNegErrorCounter
          ..personalUpdatedAt = dbTerm.personalUpdatedAt;
      }
    }
  }

  conn[ConnType.term]!.writeTxnSync(() {
    conn[ConnType.term]!
        .collection<FolderDbDS>()
        .putAllSync(foldersToDb.values.toList());
    conn[ConnType.term]!
        .collection<ModuleDbDS>()
        .putAllSync(modulesToDb.values.toList());
    conn[ConnType.term]!.collection<TermEntityDbDS>().putAllSync(termsToDb);
  });
  var res1 = conn[ConnType.term]!
      .collection<FolderDbDS>()
      .filter()
      .rootFolderIsNull()
      .findAllSync();
  print(res1);

  await OpenAndClose3.closeConnStatic(conn);

  // final folders = await mainApi.getAllFoldersFolderAllGet(headers: authHeaders);

  // final modules = await mainApi.getAllModuleModuleAllGet(headers: authHeaders);
  //
  // final terms = await mainApi.getAllTermTermAllGet(headers: authHeaders);
}
