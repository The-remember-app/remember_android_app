//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
// ignore_for_file: unused_element
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';

part 'create_user_dto.g.dart';

/// CreateUserDTO
///
/// Properties:
/// * [username] 
/// * [email] 
/// * [name] 
/// * [surname] 
/// * [password] 
@BuiltValue()
abstract class CreateUserDTO implements Built<CreateUserDTO, CreateUserDTOBuilder> {
  @BuiltValueField(wireName: r'username')
  JsonObject? get username;

  @BuiltValueField(wireName: r'email')
  JsonObject? get email;

  @BuiltValueField(wireName: r'name')
  JsonObject? get name;

  @BuiltValueField(wireName: r'surname')
  JsonObject? get surname;

  @BuiltValueField(wireName: r'password')
  JsonObject? get password;

  CreateUserDTO._();

  factory CreateUserDTO([void updates(CreateUserDTOBuilder b)]) = _$CreateUserDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateUserDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateUserDTO> get serializer => _$CreateUserDTOSerializer();
}

class _$CreateUserDTOSerializer implements PrimitiveSerializer<CreateUserDTO> {
  @override
  final Iterable<Type> types = const [CreateUserDTO, _$CreateUserDTO];

  @override
  final String wireName = r'CreateUserDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateUserDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'username';
    yield object.username == null ? null : serializers.serialize(
      object.username,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'email';
    yield object.email == null ? null : serializers.serialize(
      object.email,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'name';
    yield object.name == null ? null : serializers.serialize(
      object.name,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'surname';
    yield object.surname == null ? null : serializers.serialize(
      object.surname,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'password';
    yield object.password == null ? null : serializers.serialize(
      object.password,
      specifiedType: const FullType.nullable(JsonObject),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateUserDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateUserDTOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'username':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.username = valueDes;
          break;
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.email = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.name = valueDes;
          break;
        case r'surname':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.surname = valueDes;
          break;
        case r'password':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.password = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateUserDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateUserDTOBuilder();
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

