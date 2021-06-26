// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comp_wallet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompWalletModel _$CompWalletModelFromJson(Map<String, dynamic> json) {
  return CompWalletModel(
    pointsEarned: json['points_earned'] as int,
    points: json['points'] as int,
    chargingPoints: json['charging_points'] as int,
    nameDate: json['name_date'] as String,
    cost: json['cost'] as int,
    pointMonth: json['point_month'] as int,
    balance: (json['balance'] as num).toDouble(),
  );
}

Map<String, dynamic> _$CompWalletModelToJson(CompWalletModel instance) =>
    <String, dynamic>{
      'points_earned': instance.pointsEarned,
      'points': instance.points,
      'charging_points': instance.chargingPoints,
      'name_date': instance.nameDate,
      'cost': instance.cost,
      'point_month': instance.pointMonth,
      'balance': instance.balance,
    };
