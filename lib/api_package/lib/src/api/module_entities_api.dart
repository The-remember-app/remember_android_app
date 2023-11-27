//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';

import 'package:api_package/src/api_util.dart';
import 'package:api_package/src/model/ans_list_personalize_module_dto_union_b_error_none_type.dart';
import 'package:api_package/src/model/ans_list_uuid_union_b_error_none_type.dart';
import 'package:api_package/src/model/ans_module_dto_union_b_error_none_type.dart';
import 'package:api_package/src/model/ans_only_personalize_part_module_dto_union_b_error_none_type.dart';
import 'package:api_package/src/model/ans_personalize_module_dto_union_b_error_none_type.dart';
import 'package:api_package/src/model/create_module_dto.dart';
import 'package:api_package/src/model/create_only_personalize_part_module_dto.dart';
import 'package:api_package/src/model/err_only_auth_error.dart';
import 'package:api_package/src/model/err_only_http_validation_error_model.dart';
import 'package:api_package/src/model/err_only_literal.dart';
import 'package:api_package/src/model/err_only_literal_di.dart';
import 'package:api_package/src/model/err_only_not_found_error.dart';
import 'package:api_package/src/model/update_only_personalize_part_module_dto.dart';
import 'package:built_value/json_object.dart';

class ModuleEntitiesApi {

  final Dio _dio;

  final Serializers _serializers;

  const ModuleEntitiesApi(this._dio, this._serializers);

  /// Create Module
  /// 
  ///
  /// Parameters:
  /// * [createModuleDTO] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [AnsModuleDTOUnionBErrorNoneType] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AnsModuleDTOUnionBErrorNoneType>> createModuleCreatePost({ 
    required CreateModuleDTO createModuleDTO,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/module/create';
    final _options = Options(
      method: r'POST',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {
            'type': 'oauth2',
            'name': 'OAuth2PasswordBearer',
          },
        ],
        ...?extra,
      },
      contentType: 'application/json',
      validateStatus: validateStatus,
    );

    dynamic _bodyData;

    try {
      const _type = FullType(CreateModuleDTO);
      _bodyData = _serializers.serialize(createModuleDTO, specifiedType: _type);

    } catch(error, stackTrace) {
      throw DioException(
         requestOptions: _options.compose(
          _dio.options,
          _path,
        ),
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    final _response = await _dio.request<Object>(
      _path,
      data: _bodyData,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    AnsModuleDTOUnionBErrorNoneType? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(AnsModuleDTOUnionBErrorNoneType),
      ) as AnsModuleDTOUnionBErrorNoneType;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<AnsModuleDTOUnionBErrorNoneType>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// Create Personalize Module
  /// 
  ///
  /// Parameters:
  /// * [createOnlyPersonalizePartModuleDTO] 
  /// * [fromFolderMicroservice] - Костыль, при переписывании взаимодействия с использованием Саги будет удалён
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [AnsOnlyPersonalizePartModuleDTOUnionBErrorNoneType] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AnsOnlyPersonalizePartModuleDTOUnionBErrorNoneType>> createPersonalizeModulePersonalizeCreatePost({ 
    required CreateOnlyPersonalizePartModuleDTO createOnlyPersonalizePartModuleDTO,
    @Deprecated('fromFolderMicroservice is deprecated') JsonObject? fromFolderMicroservice,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/module/personalize/create';
    final _options = Options(
      method: r'POST',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {
            'type': 'oauth2',
            'name': 'OAuth2PasswordBearer',
          },
        ],
        ...?extra,
      },
      contentType: 'application/json',
      validateStatus: validateStatus,
    );

    final _queryParameters = <String, dynamic>{
      if (fromFolderMicroservice != null) r'from_folder_microservice': encodeQueryParameter(_serializers, fromFolderMicroservice, const FullType(JsonObject)),
    };

    dynamic _bodyData;

    try {
      const _type = FullType(CreateOnlyPersonalizePartModuleDTO);
      _bodyData = _serializers.serialize(createOnlyPersonalizePartModuleDTO, specifiedType: _type);

    } catch(error, stackTrace) {
      throw DioException(
         requestOptions: _options.compose(
          _dio.options,
          _path,
          queryParameters: _queryParameters,
        ),
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    final _response = await _dio.request<Object>(
      _path,
      data: _bodyData,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    AnsOnlyPersonalizePartModuleDTOUnionBErrorNoneType? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(AnsOnlyPersonalizePartModuleDTOUnionBErrorNoneType),
      ) as AnsOnlyPersonalizePartModuleDTOUnionBErrorNoneType;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<AnsOnlyPersonalizePartModuleDTOUnionBErrorNoneType>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// Exist Module
  /// 
  ///
  /// Parameters:
  /// * [moduleId] 
  /// * [rootFolderId] 
  /// * [authorId] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [JsonObject] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<JsonObject>> existModuleExistModuleIdGet({ 
    required JsonObject moduleId,
    JsonObject? rootFolderId,
    JsonObject? authorId,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/module/exist/{module_id}'.replaceAll('{' r'module_id' '}', encodeQueryParameter(_serializers, moduleId, const FullType(JsonObject)).toString());
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _queryParameters = <String, dynamic>{
      r'root_folder_id': encodeQueryParameter(_serializers, rootFolderId, const FullType(JsonObject)),
      r'author_id': encodeQueryParameter(_serializers, authorId, const FullType(JsonObject)),
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    JsonObject? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(JsonObject),
      ) as JsonObject;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<JsonObject>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// Exist Personalize Module
  /// 
  ///
  /// Parameters:
  /// * [moduleId] 
  /// * [rootFolderId] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [JsonObject] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<JsonObject>> existPersonalizeModulePersonalizeExistGet({ 
    required JsonObject moduleId,
    JsonObject? rootFolderId,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/module/personalize/exist';
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {
            'type': 'oauth2',
            'name': 'OAuth2PasswordBearer',
          },
        ],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _queryParameters = <String, dynamic>{
      r'module_id': encodeQueryParameter(_serializers, moduleId, const FullType(JsonObject)),
      r'root_folder_id': encodeQueryParameter(_serializers, rootFolderId, const FullType(JsonObject)),
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    JsonObject? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(JsonObject),
      ) as JsonObject;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<JsonObject>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// Get All Module
  /// 
  ///
  /// Parameters:
  /// * [authorOnly] 
  /// * [limit] 
  /// * [offset] 
  /// * [updatedAfter] - Будут возвращены лишь те сущности, обновление которых было произведено позже указанного времени. Если параметр не указан, то фильтрация по времени производиться не будет.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [AnsListPersonalizeModuleDTOUnionBErrorNoneType] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AnsListPersonalizeModuleDTOUnionBErrorNoneType>> getAllModulePersonalizeAllGet({ 
    JsonObject? authorOnly = false,
    JsonObject? limit = 100,
    JsonObject? offset = 0,
    JsonObject? updatedAfter,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/module/personalize/all';
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {
            'type': 'oauth2',
            'name': 'OAuth2PasswordBearer',
          },
        ],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _queryParameters = <String, dynamic>{
      if (authorOnly != null) r'author_only': encodeQueryParameter(_serializers, authorOnly, const FullType(JsonObject)),
      if (limit != null) r'limit': encodeQueryParameter(_serializers, limit, const FullType(JsonObject)),
      if (offset != null) r'offset': encodeQueryParameter(_serializers, offset, const FullType(JsonObject)),
      r'updated_after': encodeQueryParameter(_serializers, updatedAfter, const FullType(JsonObject)),
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    AnsListPersonalizeModuleDTOUnionBErrorNoneType? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(AnsListPersonalizeModuleDTOUnionBErrorNoneType),
      ) as AnsListPersonalizeModuleDTOUnionBErrorNoneType;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<AnsListPersonalizeModuleDTOUnionBErrorNoneType>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// Get All Module
  /// 
  ///
  /// Parameters:
  /// * [folderId] - Установите null для получения корневых модулей
  /// * [authorOnly] 
  /// * [limit] 
  /// * [offset] 
  /// * [updatedAfter] - Будут возвращены лишь те сущности, обновление которых было произведено позже указанного времени. Если параметр не указан, то фильтрация по времени производиться не будет.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [AnsListPersonalizeModuleDTOUnionBErrorNoneType] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AnsListPersonalizeModuleDTOUnionBErrorNoneType>> getAllModulePersonalizeFromFolderFolderIdGet({ 
    required JsonObject folderId,
    JsonObject? authorOnly = false,
    JsonObject? limit = 100,
    JsonObject? offset = 0,
    JsonObject? updatedAfter,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/module/personalize/from_folder/{folder_id}'.replaceAll('{' r'folder_id' '}', encodeQueryParameter(_serializers, folderId, const FullType(JsonObject)).toString());
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {
            'type': 'oauth2',
            'name': 'OAuth2PasswordBearer',
          },
        ],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _queryParameters = <String, dynamic>{
      if (authorOnly != null) r'author_only': encodeQueryParameter(_serializers, authorOnly, const FullType(JsonObject)),
      if (limit != null) r'limit': encodeQueryParameter(_serializers, limit, const FullType(JsonObject)),
      if (offset != null) r'offset': encodeQueryParameter(_serializers, offset, const FullType(JsonObject)),
      r'updated_after': encodeQueryParameter(_serializers, updatedAfter, const FullType(JsonObject)),
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    AnsListPersonalizeModuleDTOUnionBErrorNoneType? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(AnsListPersonalizeModuleDTOUnionBErrorNoneType),
      ) as AnsListPersonalizeModuleDTOUnionBErrorNoneType;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<AnsListPersonalizeModuleDTOUnionBErrorNoneType>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// Get Module Ids From Folder
  /// 
  ///
  /// Parameters:
  /// * [folderId] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [AnsListUUIDUnionBErrorNoneType] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AnsListUUIDUnionBErrorNoneType>> getModuleIdsFromFolderFromFolderFolderIdIdsOnlyGet({ 
    required JsonObject folderId,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/module/from_folder/{folder_id}/ids_only'.replaceAll('{' r'folder_id' '}', encodeQueryParameter(_serializers, folderId, const FullType(JsonObject)).toString());
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {
            'type': 'oauth2',
            'name': 'OAuth2PasswordBearer',
          },
        ],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    AnsListUUIDUnionBErrorNoneType? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(AnsListUUIDUnionBErrorNoneType),
      ) as AnsListUUIDUnionBErrorNoneType;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<AnsListUUIDUnionBErrorNoneType>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// Get Modules From Folder
  /// 
  ///
  /// Parameters:
  /// * [folderId] 
  /// * [limit] 
  /// * [offset] 
  /// * [updatedAfter] - Будут возвращены лишь те сущности, обновление которых было произведено позже указанного времени. Если параметр не указан, то фильтрация по времени производиться не будет.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [AnsListUUIDUnionBErrorNoneType] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AnsListUUIDUnionBErrorNoneType>> getModulesFromFolderFromFolderFolderIdGet({ 
    required JsonObject folderId,
    JsonObject? limit = 100,
    JsonObject? offset = 0,
    JsonObject? updatedAfter,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/module/from_folder/{folder_id}'.replaceAll('{' r'folder_id' '}', encodeQueryParameter(_serializers, folderId, const FullType(JsonObject)).toString());
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {
            'type': 'oauth2',
            'name': 'OAuth2PasswordBearer',
          },
        ],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _queryParameters = <String, dynamic>{
      if (limit != null) r'limit': encodeQueryParameter(_serializers, limit, const FullType(JsonObject)),
      if (offset != null) r'offset': encodeQueryParameter(_serializers, offset, const FullType(JsonObject)),
      r'updated_after': encodeQueryParameter(_serializers, updatedAfter, const FullType(JsonObject)),
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    AnsListUUIDUnionBErrorNoneType? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(AnsListUUIDUnionBErrorNoneType),
      ) as AnsListUUIDUnionBErrorNoneType;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<AnsListUUIDUnionBErrorNoneType>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// Get One Module
  /// 
  ///
  /// Parameters:
  /// * [moduleId] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [AnsModuleDTOUnionBErrorNoneType] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AnsModuleDTOUnionBErrorNoneType>> getOneModuleModuleIdGet({ 
    required JsonObject moduleId,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/module/{module_id}'.replaceAll('{' r'module_id' '}', encodeQueryParameter(_serializers, moduleId, const FullType(JsonObject)).toString());
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {
            'type': 'oauth2',
            'name': 'OAuth2PasswordBearer',
          },
        ],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    AnsModuleDTOUnionBErrorNoneType? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(AnsModuleDTOUnionBErrorNoneType),
      ) as AnsModuleDTOUnionBErrorNoneType;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<AnsModuleDTOUnionBErrorNoneType>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// Get One Module
  /// 
  ///
  /// Parameters:
  /// * [moduleId] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [AnsPersonalizeModuleDTOUnionBErrorNoneType] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AnsPersonalizeModuleDTOUnionBErrorNoneType>> getOneModulePersonalizeModuleIdGet({ 
    required JsonObject moduleId,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/module/personalize/{module_id}'.replaceAll('{' r'module_id' '}', encodeQueryParameter(_serializers, moduleId, const FullType(JsonObject)).toString());
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {
            'type': 'oauth2',
            'name': 'OAuth2PasswordBearer',
          },
        ],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    AnsPersonalizeModuleDTOUnionBErrorNoneType? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(AnsPersonalizeModuleDTOUnionBErrorNoneType),
      ) as AnsPersonalizeModuleDTOUnionBErrorNoneType;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<AnsPersonalizeModuleDTOUnionBErrorNoneType>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// Update Personalize Module
  /// 
  ///
  /// Parameters:
  /// * [moduleId] 
  /// * [updateOnlyPersonalizePartModuleDTO] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [AnsOnlyPersonalizePartModuleDTOUnionBErrorNoneType] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AnsOnlyPersonalizePartModuleDTOUnionBErrorNoneType>> updatePersonalizeModulePersonalizeUpdateModuleIdPut({ 
    required JsonObject moduleId,
    required UpdateOnlyPersonalizePartModuleDTO updateOnlyPersonalizePartModuleDTO,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/module/personalize/update/{module_id}'.replaceAll('{' r'module_id' '}', encodeQueryParameter(_serializers, moduleId, const FullType(JsonObject)).toString());
    final _options = Options(
      method: r'PUT',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {
            'type': 'oauth2',
            'name': 'OAuth2PasswordBearer',
          },
        ],
        ...?extra,
      },
      contentType: 'application/json',
      validateStatus: validateStatus,
    );

    dynamic _bodyData;

    try {
      const _type = FullType(UpdateOnlyPersonalizePartModuleDTO);
      _bodyData = _serializers.serialize(updateOnlyPersonalizePartModuleDTO, specifiedType: _type);

    } catch(error, stackTrace) {
      throw DioException(
         requestOptions: _options.compose(
          _dio.options,
          _path,
        ),
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    final _response = await _dio.request<Object>(
      _path,
      data: _bodyData,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    AnsOnlyPersonalizePartModuleDTOUnionBErrorNoneType? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(AnsOnlyPersonalizePartModuleDTOUnionBErrorNoneType),
      ) as AnsOnlyPersonalizePartModuleDTOUnionBErrorNoneType;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<AnsOnlyPersonalizePartModuleDTOUnionBErrorNoneType>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

}
