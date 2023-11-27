//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_package/src/model/watch_learn_type_enum.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'learn_mark_dto.g.dart';

/// LearnMarkDTO
///
/// Properties:
/// * [termId] 
/// * [startWatch] 
/// * [endWatch] 
/// * [isLearnt] 
/// * [isLearnIterStart] 
/// * [watchType] 
/// * [id] 
/// * [userId] 
/// * [moduleId] 
/// * [createdAt] 
/// * [updatedAt] 
@BuiltValue()
abstract class LearnMarkDTO implements Built<LearnMarkDTO, LearnMarkDTOBuilder> {
  @BuiltValueField(wireName: r'term_id')
  JsonObject? get termId;

  @BuiltValueField(wireName: r'start_watch')
  JsonObject? get startWatch;

  @BuiltValueField(wireName: r'end_watch')
  JsonObject? get endWatch;

  @BuiltValueField(wireName: r'is_learnt')
  JsonObject? get isLearnt;

  @BuiltValueField(wireName: r'is_learn_iter_start')
  JsonObject? get isLearnIterStart;

  @BuiltValueField(wireName: r'watch_type')
  JsonObject get watchType;
  // enum watchTypeEnum {  choice,  reverse_choice,  write,  reverse_write,  };

  @BuiltValueField(wireName: r'id')
  JsonObject? get id;

  @BuiltValueField(wireName: r'user_id')
  JsonObject? get userId;

  @BuiltValueField(wireName: r'module_id')
  JsonObject? get moduleId;

  @BuiltValueField(wireName: r'created_at')
  JsonObject? get createdAt;

  @BuiltValueField(wireName: r'updated_at')
  JsonObject? get updatedAt;

  LearnMarkDTO._();

  factory LearnMarkDTO([void updates(LearnMarkDTOBuilder b)]) = _$LearnMarkDTO;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(LearnMarkDTOBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<LearnMarkDTO> get serializer => _$LearnMarkDTOSerializer();
}

class _$LearnMarkDTOSerializer implements PrimitiveSerializer<LearnMarkDTO> {
  @override
  final Iterable<Type> types = const [LearnMarkDTO, _$LearnMarkDTO];

  @override
  final String wireName = r'LearnMarkDTO';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    LearnMarkDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'term_id';
    yield object.termId == null ? null : serializers.serialize(
      object.termId,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'start_watch';
    yield object.startWatch == null ? null : serializers.serialize(
      object.startWatch,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'end_watch';
    yield object.endWatch == null ? null : serializers.serialize(
      object.endWatch,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'is_learnt';
    yield object.isLearnt == null ? null : serializers.serialize(
      object.isLearnt,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'is_learn_iter_start';
    yield object.isLearnIterStart == null ? null : serializers.serialize(
      object.isLearnIterStart,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'watch_type';
    yield serializers.serialize(
      object.watchType,
      specifiedType: const FullType(JsonObject),
    );
    yield r'id';
    yield object.id == null ? null : serializers.serialize(
      object.id,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'user_id';
    yield object.userId == null ? null : serializers.serialize(
      object.userId,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'module_id';
    yield object.moduleId == null ? null : serializers.serialize(
      object.moduleId,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'created_at';
    yield object.createdAt == null ? null : serializers.serialize(
      object.createdAt,
      specifiedType: const FullType.nullable(JsonObject),
    );
    yield r'updated_at';
    yield object.updatedAt == null ? null : serializers.serialize(
      object.updatedAt,
      specifiedType: const FullType.nullable(JsonObject),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    LearnMarkDTO object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required LearnMarkDTOBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'term_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.termId = valueDes;
          break;
        case r'start_watch':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.startWatch = valueDes;
          break;
        case r'end_watch':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.endWatch = valueDes;
          break;
        case r'is_learnt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.isLearnt = valueDes;
          break;
        case r'is_learn_iter_start':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.isLearnIterStart = valueDes;
          break;
        case r'watch_type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(JsonObject),
          ) as JsonObject;
          result.watchType = valueDes;
          break;
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.id = valueDes;
          break;
        case r'user_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.userId = valueDes;
          break;
        case r'module_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.moduleId = valueDes;
          break;
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.createdAt = valueDes;
          break;
        case r'updated_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(JsonObject),
          ) as JsonObject?;
          if (valueDes == null) continue;
          result.updatedAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  LearnMarkDTO deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = LearnMarkDTOBuilder();
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

