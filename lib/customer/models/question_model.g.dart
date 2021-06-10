// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionModel _$QuestionModelFromJson(Map<String, dynamic> json) {
  return QuestionModel(
    mainValue: json['mainvalue'] as int,
    questionName: json['Qusetion_name'] as String,
    questionId: json['Qusetion_id'] as int,
    answers: (json['answers'] as List<dynamic>)
        .map((e) => AnswerModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    currentAnswer: json['currentAnswer'] as int,
  );
}

Map<String, dynamic> _$QuestionModelToJson(QuestionModel instance) =>
    <String, dynamic>{
      'mainvalue': instance.mainValue,
      'Qusetion_name': instance.questionName,
      'Qusetion_id': instance.questionId,
      'answers': instance.answers,
      'currentAnswer': instance.currentAnswer,
    };
