import 'package:json_annotation/json_annotation.dart';

part 'my_interests_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class MyInterestsModel {
  @JsonKey(name: "myInteristies")
  List<String> myInterests;
  @JsonKey(name: "Imgs")
  List<String> images;

  MyInterestsModel({required this.myInterests, required this.images});

  factory MyInterestsModel.fromJson(Map<String, dynamic> json) =>
      _$MyInterestsModelFromJson(json);

  Map<String, dynamic> toJson() => _$MyInterestsModelToJson(this);
}
