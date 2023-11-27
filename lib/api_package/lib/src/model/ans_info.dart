//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ans_info.g.dart';

/// AnsInfo
///
/// Properties:
/// * [apiVersion] 
/// * [deprecated] 
@BuiltValue()
abstract class AnsInfo implements Built<AnsInfo, AnsInfoBuilder> {
  @BuiltValueField(wireName: r'api_version')
  JsonObject? get apiVersion;

  @BuiltValueField(wireName: r'deprecated')
  JsonObject? get deprecated;

  AnsInfo._();

  factory AnsInfo([void updates(AnsInfoBuilder b)]) = _$AnsInfo;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AnsInfoBuilder b) => b
      ..apiVersion = JsonObject('0.0.1')
      ..deprecated = JsonObject(false);

  @BuiltValueSerializer(custom: true)
  static Serializer<AnsInfo> get serializer => _$AnsInfoSerializer();
}

class _$AnsInfoSerializer implements PrimitiveSerializer<AnsInfo> {
  @override
  final Iterable<Type> types = const [AnsInfo, _$AnsInfo];

  @override
  final String wireName = r'AnsInfo';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AnsInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.apiVersion != null) {
      yield r'api_version';
      yield serializers.serialize(
        object.apiVersion,
        specifiedType: const FullType.nullable(JsonObject),
      );
    }
    if (object.deprecated != null) {
      yield r'deprecated';
      yield serializers.serialize(
        object.deprecated,
        specifiedType: const FullType.nullable(JsonObject),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AnsInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AnsInfoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'api_version':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.apiVersion = valueDes;
          break;
        case r'deprecated':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.deprecated = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AnsInfo deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AnsInfoBuilder();
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

