// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterModel _$RegisterModelFromJson(Map<String, dynamic> json) {
  return RegisterModel(
    userName: json['UserName'] as String?,
    email: json['Email'] as String?,
    phone: json['Phone'] as String?,
    codePhone: json['CodePhone'] as String?,
    fKCountry: json['FK_Country'] as int?,
    fKCity: json['FK_City'] as int?,
    lat: (json['Lat'] as num?)?.toDouble(),
    lng: (json['Lng'] as num?)?.toDouble(),
    address: json['Address'] as String?,
    gender: json['Gender'] as String?,
    birthDate: json['BirthDate'] as String?,
    password: json['Password'] as String?,
    lang: json['lang'] as String?,
    deviceId: json['device_id'] as String?,
  );
}

Map<String, dynamic> _$RegisterModelToJson(RegisterModel instance) =>
    <String, dynamic>{
      'UserName': instance.userName,
      'Email': instance.email,
      'Phone': instance.phone,
      'CodePhone': instance.codePhone,
      'FK_Country': instance.fKCountry,
      'FK_City': instance.fKCity,
      'Lat': instance.lat,
      'Lng': instance.lng,
      'Address': instance.address,
      'Gender': instance.gender,
      'BirthDate': instance.birthDate,
      'Password': instance.password,
      'lang': instance.lang,
      'device_id': instance.deviceId,
    };
