import 'package:base_flutter/customer/models/comment_model.dart';
import 'package:base_flutter/customer/models/details_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'main_details_model.g.dart';

@JsonSerializable(nullable: true)
class MainDetailsModel {
  @JsonKey(name: "comments")
  List<CommentModel>? comments;
  @JsonKey(name: "Kayan")
  DetailsModel? details;

  MainDetailsModel({this.comments, this.details});

  factory MainDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$MainDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$MainDetailsModelToJson(this);
}
