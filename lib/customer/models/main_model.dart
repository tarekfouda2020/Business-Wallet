import 'package:json_annotation/json_annotation.dart';

part 'main_model.g.dart';

@JsonSerializable(nullable: true)
class MainModel {
  @JsonKey(name: "kayanId")
  String kayanId;
  @JsonKey(name: "kayanName")
  String kayanName;
  @JsonKey(name: "rate")
  int rate;
  @JsonKey(name: "count")
  int count;
  @JsonKey(name: "Img")
  String Img;
  @JsonKey(name: "backgroundImg")
  String backgroundImg;
  @JsonKey(name: "lat")
  String lat;
  @JsonKey(name: "lng")
  String lng;
  @JsonKey(name: "hasAds")
  int hasAds;

  @JsonKey(name: "NumberEdit")
  int numberEdit;

  MainModel({
    required this.kayanId,
    required this.kayanName,
    required this.rate,
    required this.count,
    required this.Img,
    required this.backgroundImg,
    required this.lat,
    required this.lng,
    required this.hasAds,
    required this.numberEdit,
  });

  factory MainModel.fromJson(Map<String, dynamic> json) =>
      _$MainModelFromJson(json);

  Map<String, dynamic> toJson() => _$MainModelToJson(this);
}
