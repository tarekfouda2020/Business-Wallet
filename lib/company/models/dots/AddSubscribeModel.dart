import 'dart:io';

class AddSubscribeModel {
  String? userId;
  String? adsName;
  String? adsDesc;
  String? fileName;
  File? pdf;
  List<File>? images;
  List<File>? videos;
  int? countView;
  int? durationSec;
  String? startTime;
  int? fkCity;
  String? cityName;

  String? interests;
  String? gender;
  String? accommodation;
  String? education;
  String? numberFamily;
  String? ageGroup;
  String? averageIncome;
  int? mainCost;
  int? addedCost;
  int? mainPoints;
  int? addedPoints;
  int? price;
  String? lang;

  AddSubscribeModel(
      {this.userId,
      this.adsName,
      this.adsDesc,
      this.fileName,
      this.pdf,
      this.images,
      this.videos,
      this.countView,
      this.durationSec,
      this.startTime,
      this.fkCity,
        this.cityName,
      this.interests,
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
        "ad_name": adsName,
        "ad_description": adsDesc,
        "ad_type_name": fileName,
        "ads_file": pdf,
        "ad_imgs": images,
        "ad_videos": videos,
        "count_view": countView,
        "time_view": durationSec,
        "time_start": startTime,
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
//      "type_payment": "$_payType",
        "lang": lang,
      };
}
