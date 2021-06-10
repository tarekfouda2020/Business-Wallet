// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invitation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvitationModel _$InvitationModelFromJson(Map<String, dynamic> json) {
  return InvitationModel(
    id: json['id'] as int,
    idSendCard: json['idSendCard'] as int,
    fkCity: json['fk_city'] as int,
    fkInterest: json['fk_intrest'] as int,
    fkKayan: json['fk_kayan'] as String,
    numPoint: json['num_point'] as int,
    type: json['type'] as int,
    name: json['name'] as String,
    category: json['categry'] as String,
    img: json['img'] as String,
    imgUser: json['img_user'] as String,
    rate: (json['rate'] as num).toDouble(),
    date: json['date'] as String,
    phone: json['phone'] as String,
    address: json['address'] as String,
    lat: json['lat'] as String,
    lng: json['lng'] as String,
    show: json['show'] as bool,
    isShowWhenSend: json['IsShowWhenSend'] as int,
    business: json['business'] as bool,
  );
}

Map<String, dynamic> _$InvitationModelToJson(InvitationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idSendCard': instance.idSendCard,
      'fk_city': instance.fkCity,
      'fk_intrest': instance.fkInterest,
      'fk_kayan': instance.fkKayan,
      'num_point': instance.numPoint,
      'type': instance.type,
      'name': instance.name,
      'categry': instance.category,
      'img': instance.img,
      'img_user': instance.imgUser,
      'rate': instance.rate,
      'date': instance.date,
      'phone': instance.phone,
      'address': instance.address,
      'lat': instance.lat,
      'lng': instance.lng,
      'show': instance.show,
      'IsShowWhenSend': instance.isShowWhenSend,
      'business': instance.business,
    };
