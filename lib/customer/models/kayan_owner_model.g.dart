// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kayan_owner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KayanOwnerModel _$KayanOwnerModelFromJson(Map<String, dynamic> json) {
  return KayanOwnerModel(
    name: json['name'] as String,
    addressKayan: json['address_kayan'] as String,
    id: json['Id'] as String,
    image: json['Img'] as String,
    lat: json['lat'] as String,
    lng: json['lng'] as String,
  );
}

Map<String, dynamic> _$KayanOwnerModelToJson(KayanOwnerModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address_kayan': instance.addressKayan,
      'Id': instance.id,
      'Img': instance.image,
      'lat': instance.lat,
      'lng': instance.lng,
    };
