import 'package:json_annotation/json_annotation.dart'; 

part 'drop_down_image_model.g.dart'; 

@JsonSerializable(nullable: true)
class DropDownImageModel {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "img")
  String? img;

  DropDownImageModel({this.id, this.img});

  factory DropDownImageModel.fromJson(Map<String, dynamic> json) => _$DropDownImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$DropDownImageModelToJson(this);
}

