import 'package:json_annotation/json_annotation.dart';

part 'comment_model.g.dart';

@JsonSerializable(nullable: true)
class CommentModel {
  @JsonKey(name: "Comment_Id")
  int commentId;
  @JsonKey(name: "Text")
  String text;
  @JsonKey(name: "Rate")
  int rate;
  @JsonKey(name: "Type_user")
  bool Type_user;
  @JsonKey(name: "Owner_Img")
  String ownerImg;
  @JsonKey(name: "Owner_Id")
  String ownerId;
  @JsonKey(name: "Comment_Img")
  String commentImg;
  @JsonKey(name: "Owner_Name")
  String ownerName;
  @JsonKey(name: "time")
  String time;
  @JsonKey(name: "date")
  String date;
  @JsonKey(name: "typeUser")
  int typeUser;

  CommentModel(
      {required this.commentId,
      required this.text,
      required this.rate,
      required this.Type_user,
      required this.ownerImg,
      required this.ownerId,
      required this.commentImg,
      required this.ownerName,
      required this.time,
      required this.date,
      required this.typeUser});

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommentModelToJson(this);
}
