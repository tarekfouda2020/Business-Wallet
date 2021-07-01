// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MapFilterModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MapFilterModel _$MapFilterModelFromJson(Map<String, dynamic> json) {
  return MapFilterModel(
    userId: json['UserId'] as String?,
    cityId: json['city_id'] as String?,
    topRate: json['top_rate'] as String?,
    interests: json['interests'] as String?,
    pageIndex: json['page_index'] as String?,
    searchId: json['SearchId'] as String?,
    lang: json['lang'] as String?,
    id: json['id'] as String?,
    text: json['text'] as String?,
    type: json['type'] as String?,
    lat: json['lat'] as String?,
    lng: json['lng'] as String?,
    distance: json['distance'] as String?,
  );
}

Map<String, dynamic> _$MapFilterModelToJson(MapFilterModel instance) =>
    <String, dynamic>{
      'UserId': instance.userId,
      'city_id': instance.cityId,
      'top_rate': instance.topRate,
      'interests': instance.interests,
      'page_index': instance.pageIndex,
      'SearchId': instance.searchId,
      'id': instance.id,
      'text': instance.text,
      'type': instance.type,
      'lat': instance.lat,
      'lng': instance.lng,
      'distance': instance.distance,
      'lang': instance.lang,
    };
