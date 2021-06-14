// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reconciliation_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReconciliationDataModel _$ReconciliationDataModelFromJson(
    Map<String, dynamic> json) {
  return ReconciliationDataModel(
    cost: json['Cost'] as int,
    costMun: (json['CostMun'] as num).toDouble(),
    name: json['Name'] as String,
    phoneNumber: json['PhoneNumber'] as String,
    email: json['Email'] as String,
    address: json['Address'] as String,
  );
}

Map<String, dynamic> _$ReconciliationDataModelToJson(
        ReconciliationDataModel instance) =>
    <String, dynamic>{
      'Cost': instance.cost,
      'CostMun': instance.costMun,
      'Name': instance.name,
      'PhoneNumber': instance.phoneNumber,
      'Email': instance.email,
      'Address': instance.address,
    };
