import 'package:base_flutter/customer/models/favorite_details_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'favorite_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class FavoriteModel {
  @JsonKey(name: 'HasAds')
  int hasAds;
  @JsonKey(name: 'type_ads')
  int typeAds;
  @JsonKey(name: 'ImgAnnouncement_sent_specific_category_midea')
  String imgAnnouncement;
  @JsonKey(name: 'UserAnnouncement_sent_specific_category_midea')
  FavoriteDetailsModel favoriteDetailsModel;
  @JsonKey(name: 'rateSp')
  int rateSp;
  @JsonKey(name: 'Ads_Id')
  int adsId;
  @JsonKey(name: 'date1')
  String date;
  @JsonKey(name: 'num_point1')
  double numPoint;
  @JsonKey(name: 'count')
  int count;

  FavoriteModel(
      {required this.hasAds,
      required this.typeAds,
      required this.imgAnnouncement,
      required this.favoriteDetailsModel,
      required this.rateSp,
      required this.adsId,
      required this.date,
      required this.numPoint,
      required this.count});

  factory FavoriteModel.fromJson(Map<String, dynamic> json) =>
      _$FavoriteModelFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteModelToJson(this);
}
