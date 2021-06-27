// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comp_answer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompAnswerModel _$CompAnswerModelFromJson(Map<String, dynamic> json) {
  return CompAnswerModel(
    answerName: json['answer_name'] as String,
    countAnswer: json['count_answer'] as int,
  );
}

Map<String, dynamic> _$CompAnswerModelToJson(CompAnswerModel instance) =>
    <String, dynamic>{
      'answer_name': instance.answerName,
      'count_answer': instance.countAnswer,
    };
