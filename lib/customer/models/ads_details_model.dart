import 'package:base_flutter/customer/models/comment_model.dart';
import 'package:base_flutter/customer/models/media_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ads_details_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class AdsDetailsModel {
  @JsonKey(name: 'type_file')
  String typeFile;
  @JsonKey(name: 'name_ads')
  String nameAds;
  @JsonKey(name: 'UserId')
  String userId;
  @JsonKey(name: 'address')
  String address;
  @JsonKey(name: 'count_view')
  int countView;
  @JsonKey(name: 'count_rate')
  int countRate;
  @JsonKey(name: 'sum_rate')
  int sumRate;
  @JsonKey(name: 'count_like')
  int countLike;
  @JsonKey(name: 'like')
  bool like;
  @JsonKey(name: 'follow')
  bool follow;
  @JsonKey(name: 'wish')
  bool wish;
  @JsonKey(name: 'MyRate')
  int myRate;
  @JsonKey(name: 'advert_description')
  String advertDescription;
  @JsonKey(name: 'interests')
  bool interests;
  @JsonKey(name: 'catalog')
  String catalog;
  @JsonKey(name: 'media')
  List<MediaModel> media;

  @JsonKey(name: 'Id')
  int id;
  @JsonKey(name: 'point')
  int point;
  @JsonKey(name: 'type')
  int type;
  @JsonKey(name: 'time')
  int time;
  @JsonKey(name: 'isShow')
  bool isShow;
  @JsonKey(name: 'isOwner')
  bool isOwner;
  @JsonKey(name: 'PointsForEachUser')
  int pointsForEachUser;
  @JsonKey(name: 'RateAds')
  int rateAds;
  @JsonKey(name: 'vistCount')
  int visitCount;
  @JsonKey(name: 'ads_file')
  String adsFile;
  @JsonKey(name: 'ads_text')
  String adsText;
  @JsonKey(name: 'business')
  bool business;
  @JsonKey(name: 'getCommentsKayanViewModels')
  List<CommentModel> comments;

  AdsDetailsModel({
    required this.typeFile,
    required this.nameAds,
    required this.userId,
    required this.address,
    required this.countView,
    required this.countRate,
    required this.sumRate,
    required this.countLike,
    required this.like,
    required this.follow,
    required this.wish,
    required this.myRate,
    required this.advertDescription,
    required this.interests,
    required this.catalog,
    required this.id,
    required this.point,
    required this.type,
    required this.time,
    required this.isShow,
    required this.isOwner,
    required this.pointsForEachUser,
    required this.rateAds,
    required this.visitCount,
    required this.adsFile,
    required this.adsText,
    required this.business,
  required this.comments,
  required this.media,
  });

  factory AdsDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$AdsDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$AdsDetailsModelToJson(this);
}
