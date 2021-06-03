// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainModel _$MainModelFromJson(Map<String, dynamic> json) {
  return MainModel(
    kayanId: json['kayanId'] as String,
    kayanName: json['kayanName'] as String,
    rate: json['rate'] as int,
    count: json['count'] as int,
    Img: json['Img'] as String,
    backgroundImg: json['backgroundImg'] as String,
    lat: json['lat'] as String,
    lng: json['lng'] as String,
    hasAds: json['hasAds'] as int,
  );
}

Map<String, dynamic> _$MainModelToJson(MainModel instance) => <String, dynamic>{
      'kayanId': instance.kayanId,
      'kayanName': instance.kayanName,
      'rate': instance.rate,
      'count': instance.count,
      'Img': instance.Img,
      'backgroundImg': instance.backgroundImg,
      'lat': instance.lat,
      'lng': instance.lng,
      'hasAds': instance.hasAds,
    };
