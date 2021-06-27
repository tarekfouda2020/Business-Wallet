// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cost_subscribe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CostSubscribeModel _$CostSubscribeModelFromJson(Map<String, dynamic> json) {
  return CostSubscribeModel(
    item1: (json['Item1'] as num).toDouble(),
    item2: (json['Item2'] as num).toDouble(),
    item3: (json['Item3'] as num).toDouble(),
  );
}

Map<String, dynamic> _$CostSubscribeModelToJson(CostSubscribeModel instance) =>
    <String, dynamic>{
      'Item1': instance.item1,
      'Item2': instance.item2,
      'Item3': instance.item3,
    };
