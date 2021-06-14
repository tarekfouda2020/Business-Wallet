// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'field_drop_down_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FieldDropDownModel _$FieldDropDownModelFromJson(Map<String, dynamic> json) {
  return FieldDropDownModel(
    fieldId: json['Field_Id'] as int?,
    name: json['FieldName'] as String?,
  );
}

Map<String, dynamic> _$FieldDropDownModelToJson(FieldDropDownModel instance) =>
    <String, dynamic>{
      'Field_Id': instance.fieldId,
      'FieldName': instance.name,
    };
