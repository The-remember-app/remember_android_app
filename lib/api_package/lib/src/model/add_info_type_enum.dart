//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'add_info_type_enum.g.dart';

/// AddInfoTypeEnum
@BuiltValue()
abstract class AddInfoTypeEnum implements Built<AddInfoTypeEnum, AddInfoTypeEnumBuilder> {
  AddInfoTypeEnum._();

  factory AddInfoTypeEnum([void updates(AddInfoTypeEnumBuilder b)]) = _$AddInfoTypeEnum;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AddInfoTypeEnumBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AddInfoTypeEnum> get serializer => _$AddInfoTypeEnumSerializer();
}

class _$AddInfoTypeEnumSerializer implements PrimitiveSerializer<AddInfoTypeEnum> {
  @override
  final Iterable<Type> types = const [AddInfoTypeEnum, _$AddInfoTypeEnum];

  @override
  final String wireName = r'AddInfoTypeEnum';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AddInfoTypeEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
  }

  @override
  Object serialize(
    Serializers serializers,
    AddInfoTypeEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  @override
  AddInfoTypeEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AddInfoTypeEnumBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    return result.build();
  }
}

