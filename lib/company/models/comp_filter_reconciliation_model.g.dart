// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comp_filter_reconciliation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompFilterReconciliationModel _$CompFilterReconciliationModelFromJson(
    Map<String, dynamic> json) {
  return CompFilterReconciliationModel(
    userName: json['user_name'] as String,
    phone: json['phone'] as String,
    email: json['email'] as String,
    address: json['address'] as String,
  );
}

Map<String, dynamic> _$CompFilterReconciliationModelToJson(
        CompFilterReconciliationModel instance) =>
    <String, dynamic>{
      'user_name': instance.userName,
      'phone': instance.phone,
      'email': instance.email,
      'address': instance.address,
    };
