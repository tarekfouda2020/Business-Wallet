// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comp_favorite_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompFavoriteModel _$CompFavoriteModelFromJson(Map<String, dynamic> json) {
  return CompFavoriteModel(
    id: json['ID'] as int,
    isShowWhenSend: json['IsShowWhenSend'] as int,
    idSendCard: json['idSendCard'] as int,
    img: json['img'] as String,
    imgkayan: json['imgkayan'] as String,
    kayanName: json['kayanname'] as String,
    phone: json['phone'] as String,
    kayanId: json['kayan_id'] as String,
    lat: json['lat'] as String,
    lng: json['lng'] as String,
    address: json['address'] as String,
    type: json['type'] as int,
  );
}

Map<String, dynamic> _$CompFavoriteModelToJson(CompFavoriteModel instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'IsShowWhenSend': instance.isShowWhenSend,
      'idSendCard': instance.idSendCard,
      'img': instance.img,
      'imgkayan': instance.imgkayan,
      'kayanname': instance.kayanName,
      'phone': instance.phone,
      'kayan_id': instance.kayanId,
      'lat': instance.lat,
      'lng': instance.lng,
      'address': instance.address,
      'type': instance.type,
    };
