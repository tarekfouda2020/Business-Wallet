// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cities_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CitiesModel _$CitiesModelFromJson(Map<String, dynamic> json) {
  return CitiesModel(
    id: json['id'] as int?,
    name: json['name'] as String?,
    fkCountry: json['fk_country'] as int?,
  );
}

Map<String, dynamic> _$CitiesModelToJson(CitiesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'fk_country': instance.fkCountry,
    };
