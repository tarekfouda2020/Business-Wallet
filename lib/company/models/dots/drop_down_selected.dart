import 'package:json_annotation/json_annotation.dart';

part 'drop_down_selected.g.dart';

@JsonSerializable(nullable: true)
class DropDownSelected {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "selected")
  bool selected;

  DropDownSelected(
      {required this.id, required this.name, required this.selected});

  factory DropDownSelected.fromJson(Map<String, dynamic> json) =>
      _$DropDownSelectedFromJson(json);

  Map<String, dynamic> toJson() => _$DropDownSelectedToJson(this);
}
