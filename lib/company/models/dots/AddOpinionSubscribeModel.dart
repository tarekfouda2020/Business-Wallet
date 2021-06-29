import 'dart:io';

class AddOpinionSubscribeModel {
  String? userId;
  String? adsDesc;
  String? questions;
  List<File>? adsImages;
  List<File>? adsVideo;
  String? countWatch;
  String? timeStart;
  String? fkCity;
  String? fkCityName;
  String? interests;
  String? interestsNames;

  String? gender;
  String? accommodation;
  String? education;
  String? numberFamily;
  String? ageGroup;
  String? averageIncome;
  String? mainCost;
  String? addedCost;
  String? mainPoints;
  String? addedPoints;
  String? price;
  String? lang;

  AddOpinionSubscribeModel(
      {this.userId,
      this.adsDesc,
      this.questions,
      this.adsImages,
      this.adsVideo,
      this.countWatch,
      this.timeStart,
      this.fkCity,
      this.fkCityName,
      this.interests,
      this.interestsNames,
      this.gender,
      this.accommodation,
      this.education,
      this.numberFamily,
      this.ageGroup,
      this.averageIncome,
      this.mainCost,
      this.addedCost,
      this.mainPoints,
      this.addedPoints,
      this.price,
      this.lang});

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "ad_description": adsDesc,
        "qusetions": questions,
        "ad_imgs": adsImages,
        "ad_videos": adsVideo,
        "countWatch": countWatch,
        "time_start": timeStart,
        "fk_city": fkCity,
        "interests": interests,
        "gander": gender,
        "accommodation_type": accommodation,
        "education": education,
        "number_family": numberFamily,
        "age_group": ageGroup,
        "average_income": averageIncome,
        "main_cost": mainCost,
        "cost_add": addedCost,
        "main_points": mainPoints,
        "points_add": addedPoints,
        "price": price,
        "lang": lang,
      };
}
