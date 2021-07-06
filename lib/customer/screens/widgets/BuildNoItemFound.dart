
import 'package:flutter/material.dart';

import 'NotData.dart';

class BuildNoItemFound extends StatelessWidget {
  final String title;
  final String message;

  const BuildNoItemFound({required this.title, required this.message});
  @override
  Widget build(BuildContext context) {
    return NoData(
      title: "$title",
      message: "$message",
    );
  }
}

