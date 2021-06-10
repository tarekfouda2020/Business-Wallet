import 'package:base_flutter/customer/models/investment_ads_details_model.dart';
import 'package:base_flutter/customer/models/kayan_owner_model.dart';
import 'package:base_flutter/customer/models/question_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'investment_ads_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class InvestmentAdsModel {
  @JsonKey(name: "perviewAdvertisment")
  InvestmentAdsDetailsModel investmentAdsDetails;
  @JsonKey(name: "KayanOwner")
  KayanOwnerModel kayanOwner;
  @JsonKey(name: "Qusetions")
  List<QuestionModel> questions;

  InvestmentAdsModel(
      {required this.investmentAdsDetails,
      required this.kayanOwner,
      required this.questions});

  factory InvestmentAdsModel.fromJson(Map<String, dynamic> json) =>
      _$InvestmentAdsModelFromJson(json);

  Map<String, dynamic> toJson() => _$InvestmentAdsModelToJson(this);
}
