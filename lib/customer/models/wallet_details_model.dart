import 'package:json_annotation/json_annotation.dart';

part 'wallet_details_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class WalletDetailsModel {
  @JsonKey(name: "Kayan")
  String name;
  @JsonKey(name: "TypeRegister")
  String status;


  WalletDetailsModel({
    required this.name,
    required this.status,
  });

  factory WalletDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$WalletDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$WalletDetailsModelToJson(this);
}
