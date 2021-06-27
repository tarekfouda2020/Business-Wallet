// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comp_statistics_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompStatisticsModel _$CompStatisticsModelFromJson(Map<String, dynamic> json) {
  return CompStatisticsModel(
    id: json['id'] as int,
    name: json['name'] as String,
    type: json['type'] as int,
    date: json['date'] as String,
  );
}

Map<String, dynamic> _$CompStatisticsModelToJson(
        CompStatisticsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'date': instance.date,
    };
