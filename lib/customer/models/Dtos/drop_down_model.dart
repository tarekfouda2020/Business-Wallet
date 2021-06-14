import 'package:json_annotation/json_annotation.dart';

part 'drop_down_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class DropDownModel {
  @JsonKey(name: 'Id')
  int? id;
  @JsonKey(name: 'name')
  String? name;

  DropDownModel({this.id, this.name});

  factory DropDownModel.fromJson(Map<String, dynamic> json) =>
      _$DropDownModelFromJson(json);

  Map<String, dynamic> toJson() => _$DropDownModelToJson(this);
}
