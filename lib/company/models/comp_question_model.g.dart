// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comp_question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompQuestionModel _$CompQuestionModelFromJson(Map<String, dynamic> json) {
  return CompQuestionModel(
    name: json['name'] as String,
    answers: (json['answers'] as List<dynamic>)
        .map((e) => CompAnswerModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CompQuestionModelToJson(CompQuestionModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'answers': instance.answers,
    };
