import 'package:json_annotation/json_annotation.dart'; 

part 'image_model.g.dart'; 

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class ImageModel {
  @JsonKey(name: 'Id')
  int id;
  @JsonKey(name: 'Img')
  String img;

  ImageModel({
   required this.id,required this.img});

  factory ImageModel.fromJson(Map<String, dynamic> json) => _$ImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImageModelToJson(this);
}

