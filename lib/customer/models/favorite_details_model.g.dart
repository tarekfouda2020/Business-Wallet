// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteDetailsModel _$FavoriteDetailsModelFromJson(Map<String, dynamic> json) {
  return FavoriteDetailsModel(
    idKayan: json['id_kayan'] as int,
    nameKayan: json['name_kayan'] as String,
    emailKayan: json['email_kayan'] as String,
    phoneKayan: json['phone_kayan'] as String,
    lat: json['lat'] as String,
    lng: json['lng'] as String,
    background: json['background'] as String,
    imgKayan: json['img_kayan'] as String,
    fkUser: json['Fk_User'] as String,
    mainField: json['MainField'] as String,
  );
}

Map<String, dynamic> _$FavoriteDetailsModelToJson(
        FavoriteDetailsModel instance) =>
    <String, dynamic>{
      'id_kayan': instance.idKayan,
      'name_kayan': instance.nameKayan,
      'email_kayan': instance.emailKayan,
      'phone_kayan': instance.phoneKayan,
      'lat': instance.lat,
      'lng': instance.lng,
      'background': instance.background,
      'img_kayan': instance.imgKayan,
      'Fk_User': instance.fkUser,
      'MainField': instance.mainField,
    };
