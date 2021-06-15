import 'package:json_annotation/json_annotation.dart';

part 'social_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class SocialModel {
  @JsonKey(name: 'facebook')
  String facebook;
  @JsonKey(name: 'instgram')
  String instgram;
  @JsonKey(name: 'twitter')
  String twitter;
  @JsonKey(name: 'whatsup')
  String whatsup;

  SocialModel({
    required this.facebook,
    required this.instgram,
    required this.twitter,
    required this.whatsup,
  });

  factory SocialModel.fromJson(Map<String, dynamic> json) =>
      _$SocialModelFromJson(json);

  Map<String, dynamic> toJson() => _$SocialModelToJson(this);
}
