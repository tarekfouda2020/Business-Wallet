// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auto_search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AutoSearchModel _$AutoSearchModelFromJson(Map<String, dynamic> json) {
  return AutoSearchModel(
    id: json['id'] as String,
    name: json['name'] as String,
    fieldId: json['FieldId'] as int,
  );
}

Map<String, dynamic> _$AutoSearchModelToJson(AutoSearchModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'FieldId': instance.fieldId,
    };
