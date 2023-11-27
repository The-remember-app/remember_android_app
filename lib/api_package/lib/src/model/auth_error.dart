//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_package/src/model/error_messages.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'auth_error.g.dart';

/// AuthError
///
/// Properties:
/// * [errorType] 
/// * [message] 
/// * [description] 
/// * [statusCode] 
/// * [detail] 
@BuiltValue()
abstract class AuthError implements Built<AuthError, AuthErrorBuilder> {
  @BuiltValueField(wireName: r'error_type')
  JsonObject? get errorType;

  @BuiltValueField(wireName: r'message')
  JsonObject? get message;
  // enum messageEnum {  root_folder_not_found,  not_set,  };

  @BuiltValueField(wireName: r'description')
  JsonObject? get description;

  @BuiltValueField(wireName: r'status_code')
  JsonObject? get statusCode;

  @BuiltValueField(wireName: r'detail')
  JsonObject? get detail;

  AuthError._();

  factory AuthError([void updates(AuthErrorBuilder b)]) = _$AuthError;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AuthErrorBuilder b) => b
      ..errorType = JsonObject("not_authenticated")
      ..message = JsonObject("root_folder_not_found")
      ..statusCode = JsonObject(401);

  @BuiltValueSerializer(custom: true)
  static Serializer<AuthError> get serializer => _$AuthErrorSerializer();
}

class _$AuthErrorSerializer implements PrimitiveSerializer<AuthError> {
  @override
  final Iterable<Type> types = const [AuthError, _$AuthError];

  @override
  final String wireName = r'AuthError';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AuthError object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.errorType != null) {
      yield r'error_type';
      yield serializers.serialize(
        object.errorType,
        specifiedType: const FullType.nullable(JsonObject),
      );
    }
    if (object.message != null) {
      yield r'message';
      yield serializers.serialize(
        object.message,
        specifiedType: const FullType(ErrorMessages),
      );
    }
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType.nullable(JsonObject),
      );
    }
    if (object.statusCode != null) {
      yield r'status_code';
      yield serializers.serialize(
        object.statusCode,
        specifiedType: const FullType.nullable(JsonObject),
      );
    }
    if (object.detail != null) {
      yield r'detail';
      yield serializers.serialize(
        object.detail,
        specifiedType: const FullType.nullable(JsonObject),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AuthError object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AuthErrorBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'error_type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.errorType = valueDes;
          break;
        case r'message':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(JsonObject),
          ) as JsonObject;
          result.message = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.description = valueDes;
          break;
        case r'status_code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.statusCode = valueDes;
          break;
        case r'detail':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.detail = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AuthError deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AuthErrorBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

