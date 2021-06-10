// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnswerModel _$AnswerModelFromJson(Map<String, dynamic> json) {
  return AnswerModel(
    value: json['value'] as int,
    id: json['ID'] as int,
    nameAr: json['name_ar'] as String,
  );
}

Map<String, dynamic> _$AnswerModelToJson(AnswerModel instance) =>
    <String, dynamic>{
      'value': instance.value,
      'ID': instance.id,
      'name_ar': instance.nameAr,
    };
