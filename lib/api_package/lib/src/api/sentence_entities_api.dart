//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';

import 'package:api_package/src/api_util.dart';
import 'package:api_package/src/model/ans_list_sentence_dto_union_b_error_none_type.dart';
import 'package:api_package/src/model/ans_sentence_dto_union_b_error_none_type.dart';
import 'package:api_package/src/model/create_sentence_dto.dart';
import 'package:api_package/src/model/err_only_auth_error.dart';
import 'package:api_package/src/model/err_only_http_validation_error_model.dart';
import 'package:api_package/src/model/err_only_literal.dart';
import 'package:api_package/src/model/err_only_literal_di.dart';
import 'package:api_package/src/model/err_only_not_found_error.dart';
import 'package:built_value/json_object.dart';

class SentenceEntitiesApi {

  final Dio _dio;

  final Serializers _serializers;

  const SentenceEntitiesApi(this._dio, this._serializers);

  /// Create Term
  /// 
  ///
  /// Parameters:
  /// * [moduleId] 
  /// * [termId] 
  /// * [createSentenceDTO] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [AnsSentenceDTOUnionBErrorNoneType] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AnsSentenceDTOUnionBErrorNoneType>> createTermCreateModuleIdTermIdPost1({ 
    required JsonObject moduleId,
    required JsonObject termId,
    required CreateSentenceDTO createSentenceDTO,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/sentence/create/{module_id}/{term_id}'.replaceAll('{' r'module_id' '}', encodeQueryParameter(_serializers, moduleId, const FullType(JsonObject)).toString()).replaceAll('{' r'term_id' '}', encodeQueryParameter(_serializers, termId, const FullType(JsonObject)).toString());
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
      const _type = FullType(CreateSentenceDTO);
      _bodyData = _serializers.serialize(createSentenceDTO, specifiedType: _type);

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

    AnsSentenceDTOUnionBErrorNoneType? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(AnsSentenceDTOUnionBErrorNoneType),
      ) as AnsSentenceDTOUnionBErrorNoneType;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<AnsSentenceDTOUnionBErrorNoneType>(
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

  /// Exist Sentence
  /// 
  ///
  /// Parameters:
  /// * [sentenceId] 
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
  Future<Response<JsonObject>> existSentenceExistGet({ 
    required JsonObject sentenceId,
    JsonObject? termId,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/sentence/exist';
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
      r'sentence_id': encodeQueryParameter(_serializers, sentenceId, const FullType(JsonObject)),
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

  /// Get All Term
  /// 
  ///
  /// Parameters:
  /// * [moduleIds] - Список модулей, из которых будут получены предложения
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
  /// Returns a [Future] containing a [Response] with a [AnsListSentenceDTOUnionBErrorNoneType] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AnsListSentenceDTOUnionBErrorNoneType>> getAllTermAllGet({ 
    required JsonObject moduleIds,
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
    final _path = r'/sentence/all';
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

    AnsListSentenceDTOUnionBErrorNoneType? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(AnsListSentenceDTOUnionBErrorNoneType),
      ) as AnsListSentenceDTOUnionBErrorNoneType;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<AnsListSentenceDTOUnionBErrorNoneType>(
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

  /// Get All Term
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
  /// Returns a [Future] containing a [Response] with a [AnsListSentenceDTOUnionBErrorNoneType] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AnsListSentenceDTOUnionBErrorNoneType>> getAllTermFromModuleModuleIdGet({ 
    required JsonObject moduleId,
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
    final _path = r'/sentence/from_module/{module_id}'.replaceAll('{' r'module_id' '}', encodeQueryParameter(_serializers, moduleId, const FullType(JsonObject)).toString());
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

    AnsListSentenceDTOUnionBErrorNoneType? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(AnsListSentenceDTOUnionBErrorNoneType),
      ) as AnsListSentenceDTOUnionBErrorNoneType;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<AnsListSentenceDTOUnionBErrorNoneType>(
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

  /// Get All Term
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
  /// Returns a [Future] containing a [Response] with a [AnsListSentenceDTOUnionBErrorNoneType] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AnsListSentenceDTOUnionBErrorNoneType>> getAllTermFromTermTermIdGet({ 
    required JsonObject termId,
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
    final _path = r'/sentence/from_term/{term_id}'.replaceAll('{' r'term_id' '}', encodeQueryParameter(_serializers, termId, const FullType(JsonObject)).toString());
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

    AnsListSentenceDTOUnionBErrorNoneType? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(AnsListSentenceDTOUnionBErrorNoneType),
      ) as AnsListSentenceDTOUnionBErrorNoneType;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<AnsListSentenceDTOUnionBErrorNoneType>(
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

  /// Get One Term
  /// 
  ///
  /// Parameters:
  /// * [sentenceId] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [AnsSentenceDTOUnionBErrorNoneType] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AnsSentenceDTOUnionBErrorNoneType>> getOneTermSentenceIdGet({ 
    required JsonObject sentenceId,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/sentence/{sentence_id}'.replaceAll('{' r'sentence_id' '}', encodeQueryParameter(_serializers, sentenceId, const FullType(JsonObject)).toString());
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

    AnsSentenceDTOUnionBErrorNoneType? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(AnsSentenceDTOUnionBErrorNoneType),
      ) as AnsSentenceDTOUnionBErrorNoneType;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<AnsSentenceDTOUnionBErrorNoneType>(
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
