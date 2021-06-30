// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AddBranchModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddBranchModel _$AddBranchModelFromJson(Map<String, dynamic> json) {
  return AddBranchModel(
    id: json['id'] as int?,
    address: json['address'] as String?,
    lat: json['lat'] as String?,
    lng: json['lng'] as String?,
    phone: json['phone'] as String?,
    code: json['code'] as String?,
    fromHour: json['from_hour_work'] as String?,
    toHour: json['to_hour_work'] as String?,
    status: json['status'] as bool?,
    lang: json['lang'] as String?,
  )..userId = json['user_id'] as String?;
}

Map<String, dynamic> _$AddBranchModelToJson(AddBranchModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'address': instance.address,
      'lat': instance.lat,
      'lng': instance.lng,
      'phone': instance.phone,
      'code': instance.code,
      'from_hour_work': instance.fromHour,
      'to_hour_work': instance.toHour,
      'status': instance.status,
      'lang': instance.lang,
      'user_id': instance.userId,
    };
