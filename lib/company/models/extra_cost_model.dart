import 'package:json_annotation/json_annotation.dart';

part 'extra_cost_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class ExtraCostModel {
  @JsonKey(name: 'Item1')
  double item1;
  @JsonKey(name: 'Item2')
  double item2;

  ExtraCostModel({
    required this.item1,
    required this.item2,
  });

  factory ExtraCostModel.fromJson(Map<String, dynamic> json) =>
      _$ExtraCostModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExtraCostModelToJson(this);
}
