// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extra_cost_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExtraCostModel _$ExtraCostModelFromJson(Map<String, dynamic> json) {
  return ExtraCostModel(
    item1: (json['Item1'] as num).toDouble(),
    item2: (json['Item2'] as num).toDouble(),
  );
}

Map<String, dynamic> _$ExtraCostModelToJson(ExtraCostModel instance) =>
    <String, dynamic>{
      'Item1': instance.item1,
      'Item2': instance.item2,
    };
