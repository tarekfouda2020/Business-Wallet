import 'package:json_annotation/json_annotation.dart';

part 'specific_ads_details_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class SpecificAdsDetailsModel {
  @JsonKey(name: 'date')
  String date;
  @JsonKey(name: 'fav')
  int fav;
  @JsonKey(name: 'rate')
  int rate;
  @JsonKey(name: 'like')
  int like;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'user_name')
  String userName;
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'show')
  int show;
  @JsonKey(name: 'count')
  int count;
  @JsonKey(name: 'showProfile')
  int showProfile;
  @JsonKey(name: 'ads_count_share')
  int adsCountShare;

  SpecificAdsDetailsModel(
      {required this.date,
      required this.fav,
      required this.rate,
      required this.like,
      required this.name,
      required this.userName,
      required this.id,
      required this.show,
      required this.count,
      required this.showProfile,
      required this.adsCountShare});

  factory SpecificAdsDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$SpecificAdsDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$SpecificAdsDetailsModelToJson(this);
}
