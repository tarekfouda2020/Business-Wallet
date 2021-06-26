// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barcode_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BarcodeModel _$BarcodeModelFromJson(Map<String, dynamic> json) {
  return BarcodeModel(
    barCode: json['bar_code'] as String,
    barCodeImg: json['bar_code_img'] as String,
  );
}

Map<String, dynamic> _$BarcodeModelToJson(BarcodeModel instance) =>
    <String, dynamic>{
      'bar_code': instance.barCode,
      'bar_code_img': instance.barCodeImg,
    };
