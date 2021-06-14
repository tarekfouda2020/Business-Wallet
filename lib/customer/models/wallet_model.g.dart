// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletModel _$WalletModelFromJson(Map<String, dynamic> json) {
  return WalletModel(
    pointsEarned: json['Points_earned'] as int,
    points: json['points'] as int,
    mainPoket: json['Main_poket'] as int,
    pointMonth: json['PointMonth'] as int,
    descriptionPointMonth: json['DescriptionPointMonth'] as String,
    cost: json['Cost'] as int,
    costMun: (json['CostMun'] as num).toDouble(),
  );
}

Map<String, dynamic> _$WalletModelToJson(WalletModel instance) =>
    <String, dynamic>{
      'Points_earned': instance.pointsEarned,
      'points': instance.points,
      'Main_poket': instance.mainPoket,
      'PointMonth': instance.pointMonth,
      'DescriptionPointMonth': instance.descriptionPointMonth,
      'Cost': instance.cost,
      'CostMun': instance.costMun,
    };
