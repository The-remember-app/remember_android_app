import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';
import 'package:isar/isar.dart';
import 'package:the_remember/network_processor/url_controller/folder_extension.dart';

import '../../api_package/lib/api_package.dart';
import '../../src/repositoris/db_data_source/folder.dart';
import '../network_errors.dart';
import '../new_network_processor.dart';
import '../url_controller/main.dart';

extension FolderNetworkProcessorExt on NetworkProcessor {
  Future<Map<String, String>> folderUpdate(
      Isar isar, Stream<UnaryUrlController> Function() urlsGen) async {
    Map<String, FolderDbDS> entFromWeb = {};

    // Получение обновлений с серверов
    // и слияние этих изменений с тем, что уже есть в БД
    await for (var conn in urlsGen()) {
      await for (var foldersPack in conn.getFolders()) {
        var newEnt = {
          for (var ent in [
            for (var folder in foldersPack.data!.asList)
              FolderDbDS.fromJson(standardSerializers.deserialize(folder,
                      specifiedType: const FullType(PersonalizeFolderDTO))
                  as PersonalizeFolderDTO)
          ])
            ent.uuid: FolderDbDS.entityUpdateOrCreate(ent, entFromWeb)
        };

        var foldersFromDb = {
          for (var ent in await isar
              .collection<FolderDbDS>()
              .filter()
              .userUuidEqualTo(activeUser.uuid)
              .anyOf([
            for (var i in newEnt.keys)
              if (!entFromWeb.containsKey(i)) i
          ], (q, element) => q.uuidEqualTo(element)).findAll())
            ent.uuid: FolderDbDS.entityUpdateOrCreate(ent, newEnt)
        };
        newEnt.addAll(foldersFromDb);
        entFromWeb.addAll(newEnt);
      }
    }

    // Установка rootFolderUuid
    Map<String, List<FolderDbDS>> rootFoldersIds = {};
    for (var ent in entFromWeb.values) {
      if (ent.rootFolderUuid != null && ent.rootFolder.value == null) {
        if (entFromWeb[ent.rootFolderUuid] != null) {
          ent.rootFolder.value = entFromWeb[ent.rootFolderUuid]!;
        } else {
          rootFoldersIds[ent.rootFolderUuid!] ??= [];
          rootFoldersIds[ent.rootFolderUuid!]!.add(ent);
        }
      }
    }
    var rootFoldersFromDb = await isar
        .collection<FolderDbDS>()
        .filter()
        .userUuidEqualTo(activeUser.uuid)
        .anyOf(rootFoldersIds.keys, (q, element) => q.uuidEqualTo(element))
        .findAll();
    for (var rootFolder in rootFoldersFromDb) {
      for (var folder in rootFoldersIds[rootFolder.uuid] ?? []) {
        folder.rootFolder.value = rootFolder;
      }
    }

    // Обновление сущностей в БД
    // TODO: uncomment
    // isar.writeTxnSync(() {
    //   isar.collection<FolderDbDS>().putAllSync(entFromWeb.values.toList());
    // });
    print(entFromWeb);

    // Отправка изменений на сервер


    // var newData = conn.

    throw ServerUrlIsUnavailable();
  }
}
