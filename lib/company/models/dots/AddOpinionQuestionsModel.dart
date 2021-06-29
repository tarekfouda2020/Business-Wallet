import 'package:flutter/material.dart';

class AddOpinionQuestionsModel {
  final TextEditingController questionNameController;

  final List<TextEditingController> answersNameController;

  AddOpinionQuestionsModel(
      {required this.questionNameController,
      required this.answersNameController});
}
