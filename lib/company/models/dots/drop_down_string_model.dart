import 'package:json_annotation/json_annotation.dart'; 

part 'drop_down_string_model.g.dart'; 

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class DropDownStringModel {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'name')
  String? name;

  DropDownStringModel({this.id, this.name});

  factory DropDownStringModel.fromJson(Map<String, dynamic> json) => _$DropDownStringModelFromJson(json);

  Map<String, dynamic> toJson() => _$DropDownStringModelToJson(this);
}

