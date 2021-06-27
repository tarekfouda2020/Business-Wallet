import 'package:json_annotation/json_annotation.dart';

part 'business_ads_details_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class BusinessAdsDetailsModel {
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
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'cost')
  int cost;
  @JsonKey(name: 'count_show')
  int countShow;

  BusinessAdsDetailsModel(
      {required this.date,
      required this.show,
        required  this.count,
        required this.name,
        required  this.userName,
        required  this.id,
        required   this.cost,
        required  this.countShow});

  factory BusinessAdsDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$BusinessAdsDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$BusinessAdsDetailsModelToJson(this);
}
