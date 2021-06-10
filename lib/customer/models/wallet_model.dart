import 'package:json_annotation/json_annotation.dart';

part 'wallet_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class WalletModel {
  @JsonKey(name: 'Points_earned')
  int pointsEarned;
  @JsonKey(name: 'points')
  int points;
  @JsonKey(name: 'Main_poket')
  int mainPoket;
  @JsonKey(name: 'PointMonth')
  int pointMonth;
  @JsonKey(name: 'DescriptionPointMonth')
  String descriptionPointMonth;
  @JsonKey(name: 'Cost')
  int cost;
  @JsonKey(name: 'CostMun')
  int costMun;

  WalletModel(
      {required this.pointsEarned,
      required this.points,
      required this.mainPoket,
      required this.pointMonth,
      required this.descriptionPointMonth,
      required this.cost,
      required this.costMun});

  factory WalletModel.fromJson(Map<String, dynamic> json) =>
      _$WalletModelFromJson(json);

  Map<String, dynamic> toJson() => _$WalletModelToJson(this);
}
