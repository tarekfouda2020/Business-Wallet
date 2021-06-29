import 'package:base_flutter/company/models/comp_question_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_ads_details_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class ProductAdsDetailsModel {
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'date')
  String date;
  @JsonKey(name: 'show')
  int show;
  @JsonKey(name: 'count')
  int count;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'user_name')
  String userName;
  @JsonKey(name: 'Id')
  int Id;
  @JsonKey(name: 'qustions_by_answer')
  List<CompQuestionModel> questions;

  ProductAdsDetailsModel(
      {required this.id,
      required this.date,
      required this.show,
      required this.count,
      required this.name,
      required this.userName,
      required this.Id,
      required this.questions});

  factory ProductAdsDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductAdsDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductAdsDetailsModelToJson(this);
}
