import 'package:json_annotation/json_annotation.dart';

part 'comp_wallet_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class CompWalletModel {
  @JsonKey(name: 'points_earned')
  int pointsEarned;
  @JsonKey(name: 'points')
  int points;
  @JsonKey(name: 'charging_points')
  int chargingPoints;
  @JsonKey(name: 'name_date')
  String nameDate;
  @JsonKey(name: 'cost')
  int cost;
  @JsonKey(name: 'point_month')
  int pointMonth;
  @JsonKey(name: 'balance')
  double balance;

  CompWalletModel(
      {required this.pointsEarned,
      required this.points,
      required this.chargingPoints,
      required this.nameDate,
      required this.cost,
      required this.pointMonth,
      required this.balance});

  factory CompWalletModel.fromJson(Map<String, dynamic> json) =>
      _$CompWalletModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompWalletModelToJson(this);
}
