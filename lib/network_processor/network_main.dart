import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:the_remember/api_package/lib/api_package.dart';
import 'package:the_remember/src/repositoris/db_data_source/module.dart';
import 'package:the_remember/src/repositoris/db_data_source/term.dart';
import 'package:the_remember/src/repositoris/db_data_source/user.dart';

import '../main.dart';
import '../src/repositoris/db_data_source/folder.dart';
import '../src/repositoris/db_data_source/http_utils.dart';
import '../src/repositoris/db_data_source/term_adding_info.dart';
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

Future<void> networkProcessor(UserApiProfile? userApi) async {
  if (userApi?.baseApi == null && userApi?.user != null) {
    var conn = (await OpenAndClose3.openConnStatic(
        [CollectionSchema<HttpUtilsDbDS>, CollectionSchema<UserDbDS>]));

    var serverUrlsEntities = (await conn[ConnType.server_urls]!
        .collection<HttpUtilsDbDS>()
        .where()
        .findAll());
    var user = (await conn[ConnType.user]!
        .collection<UserDbDS>()
        .getByUuid(userApi!.user!.uuid));
    var serverUrls = [for (var i in serverUrlsEntities) i.httpUrl];

    await OpenAndClose3.closeConnStatic(conn);
    await loginUser(user!.username, user.password,
        serverUrls: serverUrls, userApi: userApi);
    return;
  } else if (userApi?.baseApi == null) {
    return;
  }
  print("networkProcessor(userApi) started!!!!!!!!!!!!");
  var baseApi = userApi!.baseApi!;
  var authHeaders = userApi.authHeaders;
  // final Dio dio = Dio(BaseOptions(baseUrl: serverUrl));
  // final ApiPackage authApi =
  //     ApiPackage(dio: dio, serializers: standardSerializers);
  // final AuthApi realAuthApi = authApi.getAuthApi();
  // final authData = await realAuthApi.loginForAccessTokenAuthTokenPost(
  //     username: JsonObject("1"), password: JsonObject("1"));
  // authApi.setBearerAuth(
  //     "Authorization", "Bearer ${authData.data!.accessToken!.asString}");

  final FoldersEntitiesApi folderApi = baseApi.getFoldersEntitiesApi();
  final ModuleEntitiesApi moduleApi = baseApi.getModuleEntitiesApi();
  final TermEntitiesApi termApi = baseApi.getTermEntitiesApi();
  // JsonObject("string");
  late Map<ConnType, Isar> conn;
  late Map<String, FolderDbDS> foldersFromDb;
  late Map<String, ModuleDbDS> modulesFromDb;
  late Map<String, TermEntityDbDS> termsFromDb;
  late Map<String, TermAddingInfoDbDS> addInfoTermsFromDb;

  var coro = (() async {
    await Future.delayed(Duration(seconds: 5));
    conn = (await OpenAndClose3.openConnStatic([
      CollectionSchema<FolderDbDS>,
      CollectionSchema<ModuleDbDS>,
      CollectionSchema<TermEntityDbDS>,
      CollectionSchema<TermAddingInfoDbDS>,
    ]));

    foldersFromDb = {
      for (var ent in await conn[ConnType.term]!
          .collection<FolderDbDS>()
          .filter()
          .userUuidEqualTo(userApi!.user!.uuid)
          .findAll())
        ent.uuid: ent
    };
    modulesFromDb = {
      for (var ent in await conn[ConnType.term]!
          .collection<ModuleDbDS>()
          .filter()
          .userUuidEqualTo(userApi.user!.uuid)
          .findAll())
        ent.uuid: ent
    };
    termsFromDb = {
      for (var ent in await conn[ConnType.term]!
          .collection<TermEntityDbDS>()
          .filter()
          .userUuidEqualTo(userApi.user!.uuid)
          .findAll())
        ent.uuid: ent
    };
    addInfoTermsFromDb = {
      for (var ent in await conn[ConnType.term]!
          .collection<TermAddingInfoDbDS>()
          .filter()
          .userUuidEqualTo(userApi.user!.uuid)
          .findAll())
        ent.uuid: ent
    };
  })();

  final foldersCoro = folderApi.getAllFoldersFolderAllGet(headers: authHeaders);
  final modulesCoro = moduleApi.getAllModuleModuleAllGet(headers: authHeaders);
  final termsCoro = termApi.getAllTermTermAllGet(headers: authHeaders);
  final addInfoCoro =
      termApi.getAllAddTermInfoTermAddInfoAllGet(headers: authHeaders);

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
                specifiedType: const FullType(PersonalizeFolderDTO))
            as PersonalizeFolderDTO)
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
  var termsToDb = {
    for (var ent in [
      for (var term in terms.data!.asList)
        TermEntityDbDS.fromJson(standardSerializers.deserialize(term,
                specifiedType: const FullType(PersonalizeTermDTO))
            as PersonalizeTermDTO)
    ])
      ent.uuid: ent
  };
  for (var networkTerm in termsToDb.values) {
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

  final addInfoTerms = await addInfoCoro;
  var addInfoTermsToDb = {
    for (var ent in [
      for (var ait in addInfoTerms.data!.asList)
        TermAddingInfoDbDS.fromJson(
            standardSerializers.deserialize(
                ait,
                specifiedType: const FullType(AdditionalTermInfoDTO)
                // ..["add_info_type"]=[ait["add_info_type"]],
                //     specifiedType: const FullType(AdditionalTermInfoDTO)
            )
                as AdditionalTermInfoDTO,
            userApi.user!.uuid)
    ])
      ent.uuid: ent
  };

  for (var networkAIT in addInfoTermsToDb.values) {
    networkAIT.termEntity.value = termsToDb[networkAIT.termUuid]!;
    if (addInfoTermsFromDb[networkAIT.uuid] != null) {
      var dbAIT = addInfoTermsFromDb[networkAIT.uuid]!;
      if (networkAIT.updatedAt.isBefore(dbAIT.updatedAt)) {
        networkAIT = dbAIT;
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
    conn[ConnType.term]!
        .collection<TermEntityDbDS>()
        .putAllSync(termsToDb.values.toList());
    conn[ConnType.term]!
        .collection<TermAddingInfoDbDS>()
        .putAllSync(addInfoTermsToDb.values.toList());
  });
  var res1 = conn[ConnType.term]!
      .collection<FolderDbDS>()
      .filter()
      .rootFolderIsNull()
      .findAllSync();
  var res2 = conn[ConnType.term]!
      .collection<TermAddingInfoDbDS>()
      .where()
      .findAllSync();
  print(res1);

  await OpenAndClose3.closeConnStatic(conn);

  // final folders = await mainApi.getAllFoldersFolderAllGet(headers: authHeaders);

  // final modules = await mainApi.getAllModuleModuleAllGet(headers: authHeaders);
  //
  // final terms = await mainApi.getAllTermTermAllGet(headers: authHeaders);
}

Future<void> getUserFromServer(
  baseApiContainer,
  authHeaders,
  String username,
  String password,
  UserApiProfile? userApi,
) async {
  var conn = (await OpenAndClose3.openConnStatic([CollectionSchema<UserDbDS>]));

  var user =
      (await conn[ConnType.user]!.collection<UserDbDS>().getByUsername(username)
      // .filter()
      // .usernameEqualTo(username)
      // .findAll()
      // .where()
      // .findAll()
      );
  if (user == null) {
    var userApi = baseApiContainer.getUsersEntitiesApi();

    var userFromServerData =
        await userApi.readUsersMeUserMeGet(headers: authHeaders);
    user =
        UserDbDS.fromJson(userFromServerData.data as UserDTO, password, true);
  } else if (user == userApi?.user) {
    userApi?.userChange();
  }
  userApi?.user = user;
  conn[ConnType.user]!.writeTxn(() async {
    (await conn[ConnType.user]!
        .collection<UserDbDS>()
        .put(user!..active = true));
  });

  await OpenAndClose3.closeConnStatic(conn);
}

Future getAuthHeaders(
    AuthApi realAuthApi,
    String url,
    ApiPackage baseApiContainer,
    String username,
    String password,
    UserApiProfile? userApi,
    Function(String?)? onErrorCallback) async {
  Response<Token>? authData = null;
  try {
    authData = await realAuthApi.loginForAccessTokenAuthTokenPost(
        username: JsonObject(username), password: JsonObject(password));
  } catch (e) {
    if (onErrorCallback != null) {
      onErrorCallback(
          "На сервере ${url} пользователя с таким логином и паролем не найдено");
    }
  } finally {
    if (authData?.statusCode == 200) {
      baseApiContainer.setBearerAuth(
          "Authorization", "Bearer ${authData?.data!.accessToken!.asString}");
      var authHeaders = {
        "Authorization": "Bearer ${authData?.data!.accessToken!.asString}"
      };
      userApi?.baseApi = baseApiContainer;
      userApi?.authHeaders = authHeaders;
      if (userApi?.user == null) {
        await getUserFromServer(
            baseApiContainer, authHeaders, username, password, userApi);
      } else {
        await networkProcessor(userApi);
      }
    } else {
      if (onErrorCallback != null) {
        onErrorCallback(
            "На сервере ${url} пользователя с таким логином и паролем не найдено");
      }
    }
  }
}

Future testServerUrl(
    String url,
    List<bool> goodUrlFounded,
    String username,
    String password,
    UserApiProfile? userApi,
    Function(String?)? onErrorCallback) async {
  final Dio dio = Dio(BaseOptions(baseUrl: url));
  final ApiPackage baseApiContainer =
      ApiPackage(dio: dio, serializers: standardSerializers);
  final AuthApi realAuthApi = baseApiContainer.getAuthApi();
  var healthyCheck = await realAuthApi.loginForAccessTokenAuthHealthcheckPost();
  if (goodUrlFounded[0]) {
    return;
  }
  if (healthyCheck.statusCode == 200) {
    goodUrlFounded[0] = true;
  }
  await getAuthHeaders(realAuthApi, url, baseApiContainer, username, password,
      userApi, onErrorCallback);
}

Future<void> loginUser(
  String username,
  String password, {
  List<String>? serverUrls,
  required UserApiProfile? userApi,
  Function(String?)? onErrorCallback = null,
}) async {
  List<bool> goodUrlFounded = [false];

  if (userApi?.baseApi == null) {
    if (serverUrls == null) {
      var conn = (await OpenAndClose3.openConnStatic(
          [CollectionSchema<HttpUtilsDbDS>]));

      var serverUrlsEntities = (await conn[ConnType.server_urls]!
          .collection<HttpUtilsDbDS>()
          .where()
          .findAll());
      serverUrls = [for (var i in serverUrlsEntities) i.httpUrl];

      await OpenAndClose3.closeConnStatic(conn);
    } else {
      var conn = (await OpenAndClose3.openConnStatic(
          [CollectionSchema<HttpUtilsDbDS>]));

      var serverUrlsEntities = [
        for (var i in serverUrls) HttpUtilsDbDS()..httpUrl = i
      ];
      conn[ConnType.server_urls]!.writeTxnSync(() => conn[ConnType.server_urls]!
          .collection<HttpUtilsDbDS>()
          .putAllSync(serverUrlsEntities));

      // serverUrls = [for (var i in serverUrlsEntities) i.httpUrl];

      await OpenAndClose3.closeConnStatic(conn);
    }
    serverUrls.forEach((url) async => await testServerUrl(
        url, goodUrlFounded, username, password, userApi, onErrorCallback));
  } else if (userApi?.authHeaders == null ||
      (userApi?.authHeaders != null && userApi!.authHeaders.isEmpty)) {
    await getAuthHeaders(await userApi!.baseApi!.getAuthApi(), "<unnamed>",
        userApi.baseApi!, username, password, userApi, onErrorCallback);
  } else {
    await getUserFromServer(
        userApi?.baseApi, userApi?.authHeaders, username, password, userApi);
  }

  return;
}
