import 'package:base_flutter/company/models/comp_answer_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comp_question_model.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class CompQuestionModel {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'answers')
  List<CompAnswerModel> answers;

  CompQuestionModel({required this.name, required this.answers});

  factory CompQuestionModel.fromJson(Map<String, dynamic> json) =>
      _$CompQuestionModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompQuestionModelToJson(this);
}
