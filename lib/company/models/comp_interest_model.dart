import 'package:json_annotation/json_annotation.dart';

part 'comp_interest_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class CompInterestModel {
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'active')
  bool active;

  CompInterestModel({
    required this.id,
    required this.name,
    required this.active,
  });

  factory CompInterestModel.fromJson(Map<String, dynamic> json) =>
      _$CompInterestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompInterestModelToJson(this);
}
