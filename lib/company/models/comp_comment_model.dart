import 'package:json_annotation/json_annotation.dart'; 

part 'comp_comment_model.g.dart'; 

@JsonSerializable(nullable: true)
class CompCommentModel {
  @JsonKey(name: "comment_id")
  int? commentId;
  @JsonKey(name: "text")
  String? text;
  @JsonKey(name: "rate")
  int? rate;
  @JsonKey(name: "owner_img")
  String? ownerImg;
  @JsonKey(name: "comment_img")
  String? commentImg;
  @JsonKey(name: "owner_name")
  String? ownerName;
  @JsonKey(name: "date")
  String? date;
  @JsonKey(name: "fk_owner_comment")
  String? fkOwnerComment;

  CompCommentModel({this.commentId, this.text, this.rate, this.ownerImg, this.commentImg, this.ownerName, this.date, this.fkOwnerComment});

  factory CompCommentModel.fromJson(Map<String, dynamic> json) => _$CompCommentModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompCommentModelToJson(this);
}

