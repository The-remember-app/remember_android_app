//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';

import 'package:api_package/src/api_util.dart';
import 'package:api_package/src/model/ans_additional_term_info_dto_union_b_error_none_type.dart';
import 'package:api_package/src/model/ans_list_additional_term_info_dto_union_b_error_none_type.dart';
import 'package:api_package/src/model/create_additional_term_info_dto.dart';
import 'package:api_package/src/model/err_only_auth_error.dart';
import 'package:api_package/src/model/err_only_http_validation_error_model.dart';
import 'package:api_package/src/model/err_only_literal.dart';
import 'package:api_package/src/model/err_only_literal_di.dart';
import 'package:api_package/src/model/err_only_not_found_error.dart';
import 'package:built_value/json_object.dart';

class AdditionalInfoOfTermsApi {

  final Dio _dio;

  final Serializers _serializers;

  const AdditionalInfoOfTermsApi(this._dio, this._serializers);

  /// Create Term
  /// 
  ///
  /// Parameters:
  /// * [moduleId] 
  /// * [termId] 
  /// * [createAdditionalTermInfoDTO] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [AnsAdditionalTermInfoDTOUnionBErrorNoneType] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AnsAdditionalTermInfoDTOUnionBErrorNoneType>> createTermCreateModuleIdTermIdPost({ 
    required JsonObject moduleId,
    required JsonObject termId,
    required CreateAdditionalTermInfoDTO createAdditionalTermInfoDTO,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/term/add_info/create/{module_id}/{term_id}'.replaceAll('{' r'module_id' '}', encodeQueryParameter(_serializers, moduleId, const FullType(JsonObject)).toString()).replaceAll('{' r'term_id' '}', encodeQueryParameter(_serializers, termId, const FullType(JsonObject)).toString());
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
      const _type = FullType(CreateAdditionalTermInfoDTO);
      _bodyData = _serializers.serialize(createAdditionalTermInfoDTO, specifiedType: _type);

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

    AnsAdditionalTermInfoDTOUnionBErrorNoneType? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(AnsAdditionalTermInfoDTOUnionBErrorNoneType),
      ) as AnsAdditionalTermInfoDTOUnionBErrorNoneType;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<AnsAdditionalTermInfoDTOUnionBErrorNoneType>(
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

  /// Exist Term Info
  /// 
  ///
  /// Parameters:
  /// * [addTermId] 
  /// * [termId] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [JsonObject] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<JsonObject>> existTermInfoExistGet({ 
    required JsonObject addTermId,
    JsonObject? termId,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/term/add_info/exist';
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
      r'add_term_id': encodeQueryParameter(_serializers, addTermId, const FullType(JsonObject)),
      r'term_id': encodeQueryParameter(_serializers, termId, const FullType(JsonObject)),
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

  /// Get All Add Term Info
  /// 
  ///
  /// Parameters:
  /// * [moduleIds] - Список модулей, из которых будут получены термины
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
  /// Returns a [Future] containing a [Response] with a [AnsListAdditionalTermInfoDTOUnionBErrorNoneType] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AnsListAdditionalTermInfoDTOUnionBErrorNoneType>> getAllAddTermInfoAllGet({ 
    required JsonObject moduleIds,

    JsonObject? updatedAfter,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    bool? authorOnly = false,
    int? limit = 100,
    int? offset = 0,
  }) async {
    final _path = r'/term/add_info/all';
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
      r'module_ids': encodeQueryParameter(_serializers, moduleIds, const FullType(JsonObject)),
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

    AnsListAdditionalTermInfoDTOUnionBErrorNoneType? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(AnsListAdditionalTermInfoDTOUnionBErrorNoneType),
      ) as AnsListAdditionalTermInfoDTOUnionBErrorNoneType;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<AnsListAdditionalTermInfoDTOUnionBErrorNoneType>(
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

  /// Get All Add Term Info From Module
  /// 
  ///
  /// Parameters:
  /// * [moduleId] 
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
  /// Returns a [Future] containing a [Response] with a [AnsListAdditionalTermInfoDTOUnionBErrorNoneType] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AnsListAdditionalTermInfoDTOUnionBErrorNoneType>> getAllAddTermInfoFromModuleFromModuleModuleIdGet({ 
    required JsonObject moduleId,
    bool? authorOnly = false,
    int? limit = 100,
    int? offset = 0,
    JsonObject? updatedAfter,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/term/add_info/from_module/{module_id}'.replaceAll('{' r'module_id' '}', encodeQueryParameter(_serializers, moduleId, const FullType(JsonObject)).toString());
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

    AnsListAdditionalTermInfoDTOUnionBErrorNoneType? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(AnsListAdditionalTermInfoDTOUnionBErrorNoneType),
      ) as AnsListAdditionalTermInfoDTOUnionBErrorNoneType;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<AnsListAdditionalTermInfoDTOUnionBErrorNoneType>(
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

  /// Get All Add Term Info From Module
  /// 
  ///
  /// Parameters:
  /// * [termId] 
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
  /// Returns a [Future] containing a [Response] with a [AnsListAdditionalTermInfoDTOUnionBErrorNoneType] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AnsListAdditionalTermInfoDTOUnionBErrorNoneType>> getAllAddTermInfoFromModuleFromTermTermIdGet({ 
    required JsonObject termId,
    bool? authorOnly = false,
    int? limit = 100,
    int? offset = 0,
    JsonObject? updatedAfter,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/term/add_info/from_term/{term_id}'.replaceAll('{' r'term_id' '}', encodeQueryParameter(_serializers, termId, const FullType(JsonObject)).toString());
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

    AnsListAdditionalTermInfoDTOUnionBErrorNoneType? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(AnsListAdditionalTermInfoDTOUnionBErrorNoneType),
      ) as AnsListAdditionalTermInfoDTOUnionBErrorNoneType;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<AnsListAdditionalTermInfoDTOUnionBErrorNoneType>(
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
