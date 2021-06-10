import 'package:base_flutter/customer/models/ads_details_model.dart';
import 'package:base_flutter/customer/models/kayan_owner_model.dart';
import 'package:base_flutter/customer/models/my_interests_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'specific_ads_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class SpecificAdsModel {
  @JsonKey(name: "perviewAdvertisment")
  AdsDetailsModel previewAds;
  @JsonKey(name: "KayanOwner")
  KayanOwnerModel kayanOwner;
  @JsonKey(name: "data")
  MyInterestsModel myInterests;

  SpecificAdsModel(
      {required this.previewAds,
      required this.kayanOwner,
      required this.myInterests});

  factory SpecificAdsModel.fromJson(Map<String, dynamic> json) =>
      _$SpecificAdsModelFromJson(json);

  Map<String, dynamic> toJson() => _$SpecificAdsModelToJson(this);
}
