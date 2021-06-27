// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comp_interest_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompInterestModel _$CompInterestModelFromJson(Map<String, dynamic> json) {
  return CompInterestModel(
    id: json['id'] as int,
    name: json['name'] as String,
    active: json['active'] as bool,
  );
}

Map<String, dynamic> _$CompInterestModelToJson(CompInterestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'active': instance.active,
    };
