// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intro_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IntroModel _$IntroModelFromJson(Map<String, dynamic> json) {
  return IntroModel(
    textPromoAr: json['text_promo_ar'] as String,
    textPromoEn: json['text_promo_en'] as String,
    textStepOne: json['text_step_one'] as String,
    textStepTwo: json['text_step_two'] as String,
    textStepThree: json['text_step_three'] as String,
    kayanOne: json['text_step_Kayan_one'] as String,
    kayanTwo: json['text_step_Kayan_two'] as String,
    kayanThree: json['text_step_Kayan_three'] as String,
    kayanFour: json['text_step_Kayan_four'] as String,
    kayanFive: json['text_step_Kayan_five'] as String,
    kayanSex: json['text_step_Kayan_sex'] as String,
    textStepOneUser: json['text_step_one_user'] as String,
    textStepTwoUser: json['text_step_two_user'] as String,
    textStepThreeUser: json['text_step_three_user'] as String,
    textStepFourUser: json['text_step_four_user'] as String,
    shareAndroid: json['share_android'] as String,
    shareIos: json['share_ios'] as String,
    show: json['show'] as bool,
  );
}

Map<String, dynamic> _$IntroModelToJson(IntroModel instance) =>
    <String, dynamic>{
      'text_promo_ar': instance.textPromoAr,
      'text_promo_en': instance.textPromoEn,
      'text_step_one': instance.textStepOne,
      'text_step_two': instance.textStepTwo,
      'text_step_three': instance.textStepThree,
      'text_step_Kayan_one': instance.kayanOne,
      'text_step_Kayan_two': instance.kayanTwo,
      'text_step_Kayan_three': instance.kayanThree,
      'text_step_Kayan_four': instance.kayanFour,
      'text_step_Kayan_five': instance.kayanFive,
      'text_step_Kayan_sex': instance.kayanSex,
      'text_step_one_user': instance.textStepOneUser,
      'text_step_two_user': instance.textStepTwoUser,
      'text_step_three_user': instance.textStepThreeUser,
      'text_step_four_user': instance.textStepFourUser,
      'share_android': instance.shareAndroid,
      'share_ios': instance.shareIos,
      'show': instance.show,
    };
