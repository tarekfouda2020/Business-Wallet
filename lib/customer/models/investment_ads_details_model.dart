import 'package:base_flutter/customer/models/media_model.dart';
import 'package:base_flutter/customer/models/question_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'investment_ads_details_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class InvestmentAdsDetailsModel {
  @JsonKey(name: 'Id')
  int id;
  @JsonKey(name: 'advert_description')
  String advertDescription;
  @JsonKey(name: 'UserId')
  String userId;
  @JsonKey(name: 'type')
  int type;
  @JsonKey(name: 'point')
  double point;
  @JsonKey(name: 'count_view')
  int countView;
  @JsonKey(name: 'time')
  int time;
  @JsonKey(name: 'MyRate')
  int myRate;
  @JsonKey(name: 'isShow')
  bool isShow;
  @JsonKey(name: 'isOwner')
  bool isOwner;
  @JsonKey(name: 'PointsForEachUser')
  int pintsForEachUser;
  @JsonKey(name: 'follow')
  bool follow;
  @JsonKey(name: 'images')
  List<MediaModel> images;
  @JsonKey(name: 'imgs')
  List<String> imgs;
  @JsonKey(name: 'videos')
  List<String> videos;
  @JsonKey(name: 'myQusetion')
  List<QuestionModel> myQuestions;

  InvestmentAdsDetailsModel(
      {required this.id,
      required this.advertDescription,
      required this.userId,
      required this.type,
      required this.point,
      required this.countView,
      required this.time,
      required this.myRate,
      required this.isShow,
      required this.isOwner,
      required this.pintsForEachUser,
      required this.follow,
      required this.images,
      required this.imgs,
      required this.videos,
      required this.myQuestions});

  factory InvestmentAdsDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$InvestmentAdsDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$InvestmentAdsDetailsModelToJson(this);
}
