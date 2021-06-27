import 'package:json_annotation/json_annotation.dart';

part 'barcode_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class BarcodeModel {
  @JsonKey(name: 'bar_code')
  String barCode;
  @JsonKey(name: 'bar_code_img')
  String barCodeImg;

  BarcodeModel({required this.barCode, required this.barCodeImg});

  factory BarcodeModel.fromJson(Map<String, dynamic> json) =>
      _$BarcodeModelFromJson(json);

  Map<String, dynamic> toJson() => _$BarcodeModelToJson(this);
}
