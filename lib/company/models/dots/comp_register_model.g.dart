// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comp_register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompRegisterModel _$CompRegisterModelFromJson(Map<String, dynamic> json) {
  return CompRegisterModel(
    userName: json['user_name'] as String?,
    email: json['email'] as String?,
    phone: json['phone'] as String?,
    codePhone: json['code_phone'] as String?,
    lat: json['Lat'] as String?,
    lng: json['Lng'] as String?,
    address: json['Address'] as String?,
    fKCountry: json['fK_country'] as int?,
    fKCity: json['fK_city'] as int?,
    kayanName: json['kayan_name'] as String?,
    kayanEmail: json['kayan_email'] as String?,
    kayanPhone: json['kayan_phone'] as String?,
    kayanPhoneCode: json['kayan_phone_code'] as String?,
    password: json['password'] as String?,
    promoCode: json['promo_code'] as String?,
    lang: json['lang'] as String?,
    deviceId: json['device_id'] as String?,
  );
}

Map<String, dynamic> _$CompRegisterModelToJson(CompRegisterModel instance) =>
    <String, dynamic>{
      'user_name': instance.userName,
      'email': instance.email,
      'phone': instance.phone,
      'code_phone': instance.codePhone,
      'Lat': instance.lat,
      'Lng': instance.lng,
      'Address': instance.address,
      'fK_country': instance.fKCountry,
      'fK_city': instance.fKCity,
      'kayan_name': instance.kayanName,
      'kayan_email': instance.kayanEmail,
      'kayan_phone': instance.kayanPhone,
      'kayan_phone_code': instance.kayanPhoneCode,
      'password': instance.password,
      'promo_code': instance.promoCode,
      'lang': instance.lang,
      'device_id': instance.deviceId,
    };
