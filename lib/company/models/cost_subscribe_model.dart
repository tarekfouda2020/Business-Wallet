import 'package:json_annotation/json_annotation.dart';

part 'cost_subscribe_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class CostSubscribeModel {
  @JsonKey(name: 'Item1')
  double item1;
  @JsonKey(name: 'Item2')
  double item2;
  @JsonKey(name: 'Item3')
  double item3;

  CostSubscribeModel({
    required this.item1,
    required this.item2,
    required this.item3,
  });

  factory CostSubscribeModel.fromJson(Map<String, dynamic> json) =>
      _$CostSubscribeModelFromJson(json);

  Map<String, dynamic> toJson() => _$CostSubscribeModelToJson(this);
}
