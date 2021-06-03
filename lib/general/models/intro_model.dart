import 'package:json_annotation/json_annotation.dart';

part 'intro_model.g.dart';

@JsonSerializable(nullable: true)
class IntroModel {
  @JsonKey(name: "text_promo_ar")
  String textPromoAr;
  @JsonKey(name: "text_promo_en")
  String textPromoEn;
  @JsonKey(name: "text_step_one")
  String textStepOne;
  @JsonKey(name: "text_step_two")
  String textStepTwo;
  @JsonKey(name: "text_step_three")
  String textStepThree;
  @JsonKey(name: "text_step_Kayan_one")
  String kayanOne;
  @JsonKey(name: "text_step_Kayan_two")
  String kayanTwo;
  @JsonKey(name: "text_step_Kayan_three")
  String kayanThree;
  @JsonKey(name: "text_step_Kayan_four")
  String kayanFour;
  @JsonKey(name: "text_step_Kayan_five")
  String kayanFive;
  @JsonKey(name: "text_step_Kayan_sex")
  String kayanSex;
  @JsonKey(name: "text_step_one_user")
  String textStepOneUser;
  @JsonKey(name: "text_step_two_user")
  String textStepTwoUser;
  @JsonKey(name: "text_step_three_user")
  String textStepThreeUser;
  @JsonKey(name: "text_step_four_user")
  String textStepFourUser;
  @JsonKey(name: "share_android")
  String shareAndroid;
  @JsonKey(name: "share_ios")
  String shareIos;
  bool show;

  IntroModel(
      {required this.textPromoAr,
      required this.textPromoEn,
      required this.textStepOne,
      required this.textStepTwo,
      required this.textStepThree,
      required this.kayanOne,
      required this.kayanTwo,
      required this.kayanThree,
      required this.kayanFour,
      required this.kayanFive,
      required this.kayanSex,
      required this.textStepOneUser,
      required this.textStepTwoUser,
      required this.textStepThreeUser,
      required this.textStepFourUser,
      required this.shareAndroid,
      required this.shareIos,
      required this.show}); // IntroModel({this.textPromoAr, this.textPromoEn, this.textStepOne, this.textStepTwo, this.textStepThree, this.textStep_KayanOne, this.textStep_KayanTwo, this.textStep_KayanThree, this.textStep_KayanFour, this.textStep_KayanFive, this.textStep_KayanSex, this.textStepOneUser, this.textStepTwoUser, this.textStepThreeUser, this.textStepFourUser, this.shareAndroid, this.shareIos});

  factory IntroModel.fromJson(Map<String, dynamic> json) =>
      _$IntroModelFromJson(json);

  Map<String, dynamic> toJson() => _$IntroModelToJson(this);
}
