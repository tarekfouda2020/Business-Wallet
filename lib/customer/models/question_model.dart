import 'package:base_flutter/customer/models/answer_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'question_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class QuestionModel {
  @JsonKey(name: 'mainvalue')
  int mainValue;
  @JsonKey(name: 'Qusetion_name')
  String questionName;
  @JsonKey(name: 'Qusetion_id')
  int questionId;
  @JsonKey(name: 'answers')
  List<AnswerModel> answers;
  int currentAnswer;

  QuestionModel(
      {required this.mainValue,
      required this.questionName,
      required this.questionId,
      required this.answers,
      this.currentAnswer = 0});

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionModelToJson(this);
}
