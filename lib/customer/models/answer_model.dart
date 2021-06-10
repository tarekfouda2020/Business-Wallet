import 'package:json_annotation/json_annotation.dart';

part 'answer_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class AnswerModel {
  @JsonKey(name: 'value')
  int value;
  @JsonKey(name: 'ID')
  int id;
  @JsonKey(name: 'name_ar')
  String nameAr;

  AnswerModel({
    required this.value,
    required this.id,
    required this.nameAr,
  });

  factory AnswerModel.fromJson(Map<String, dynamic> json) =>
      _$AnswerModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerModelToJson(this);
}
