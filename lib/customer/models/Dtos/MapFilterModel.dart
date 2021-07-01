import 'package:json_annotation/json_annotation.dart';

part 'MapFilterModel.g.dart';

@JsonSerializable(nullable: true)
class MapFilterModel {

  @JsonKey(name: "UserId")
  String? userId;
  @JsonKey(name: "city_id")
  String? cityId;
  @JsonKey(name: "top_rate")
  String? topRate;
  @JsonKey(name: "interests")
  String? interests;
  @JsonKey(name: "page_index")
  String? pageIndex;
  @JsonKey(name: "SearchId")
  String? searchId;
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "text")
  String? text;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "lat")
  String? lat;
  @JsonKey(name: "lng")
  String? lng;
  @JsonKey(name: "distance")
  String? distance;
  @JsonKey(name: "lang")
  String? lang;


  MapFilterModel(
      {this.userId,
      this.cityId,
      this.topRate,
      this.interests,
      this.pageIndex,
      this.searchId,
      this.lang,
      this.id,
      this.text,
      this.type,
      this.lat,
      this.lng,
      this.distance});

  factory MapFilterModel.fromJson(Map<String, dynamic> json) => _$MapFilterModelFromJson(json);

  Map<String, dynamic> toJson() => _$MapFilterModelToJson(this);
}