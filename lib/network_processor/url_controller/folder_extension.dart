

import 'package:built_value/json_object.dart';
import 'package:dio/dio.dart';

import '../../api_package/lib/api_package.dart';
import '../network_errors.dart';
import 'main.dart';

extension AuthUnaryUrlControllerExt on UnaryUrlController {

  Stream<AnsListPersonalizeFolderDTOUnionBErrorNoneType> getFolders() async* {
    await for (var respFuture in pagination<AnsListPersonalizeFolderDTOUnionBErrorNoneType>(
        folderApi.getAllFoldersPersonalizeAllGet
    , (p0, limit) => p0?.data?.data != null && p0!.data!.data!.asList.length >= limit)){
      var resp = await respFuture;
      if (resp == null){
        throw UnimplementedError();
      }

      // var castedData = resp.data!.data as List<PersonalizeFolderDTO>;

      yield  resp.data!;
    }

    throw ServerUrlIsUnavailable();
  }

}