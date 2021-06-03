import 'package:json_annotation/json_annotation.dart';

part 'user_interest_model.g.dart';

@JsonSerializable(nullable: true)
class UserInterestModel {
  @JsonKey(name: "Id")
  int id;
  @JsonKey(name: "Name")
  String name;
  @JsonKey(name: "Choose")
  bool choose;

  UserInterestModel(
      {required this.id, required this.name, required this.choose});

  factory UserInterestModel.fromJson(Map<String, dynamic> json) =>
      _$UserInterestModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserInterestModelToJson(this);
}
