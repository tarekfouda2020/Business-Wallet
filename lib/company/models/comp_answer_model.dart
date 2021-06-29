import 'package:json_annotation/json_annotation.dart';

part 'comp_answer_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class CompAnswerModel {
  @JsonKey(name: 'answer_name')
  String answerName;
  @JsonKey(name: 'count_answer')
  int countAnswer;

  CompAnswerModel({
   required this.answerName,required this.countAnswer});

  factory CompAnswerModel.fromJson(Map<String, dynamic> json) =>
      _$CompAnswerModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompAnswerModelToJson(this);
}
