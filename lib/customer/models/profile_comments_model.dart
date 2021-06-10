import 'package:json_annotation/json_annotation.dart';

part 'profile_comments_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class ProfileCommentsModel {
  @JsonKey(name: 'kayanId')
  String kayanId;
  @JsonKey(name: 'kayanName')
  String kayanName;
  @JsonKey(name: 'rate')
  int rate;
  @JsonKey(name: 'Img')
  String Img;
  @JsonKey(name: 'backgroundImg')
  String backgroundImg;
  @JsonKey(name: 'lat')
  String lat;
  @JsonKey(name: 'lng')
  String lng;
  @JsonKey(name: 'comment')
  String comment;
  @JsonKey(name: 'comment_id')
  int commentId;
  @JsonKey(name: 'comment_img')
  String commentImg;

  ProfileCommentsModel(
      {required this.kayanId,
      required this.kayanName,
      required this.rate,
      required this.Img,
      required this.backgroundImg,
      required this.lat,
      required this.lng,
      required this.comment,
      required this.commentId,
      required this.commentImg});

  factory ProfileCommentsModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileCommentsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileCommentsModelToJson(this);
}
