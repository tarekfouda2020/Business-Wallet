// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    customerModel: json['customerModel'] == null
        ? null
        : CustomerModel.fromJson(json['customerModel'] as Map<String, dynamic>),
    companyModel: json['companyModel'] == null
        ? null
        : CompanyModel.fromJson(json['companyModel'] as Map<String, dynamic>),
    deviceId: json['device_id'] as String?,
    typeUser: json['type_user'] as int?,
    lang: json['lang'] as String?,
    interest: json['interest'] as bool?,
    step: json['step'] as int?,
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'customerModel': instance.customerModel,
      'companyModel': instance.companyModel,
      'device_id': instance.deviceId,
      'type_user': instance.typeUser,
      'lang': instance.lang,
      'interest': instance.interest,
      'step': instance.step,
    };
