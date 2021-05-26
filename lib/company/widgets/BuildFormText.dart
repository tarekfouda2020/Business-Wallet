import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/widgets/MyText.dart';
import 'package:flutter/material.dart';

class BuildFormText extends StatelessWidget {
  final String text;

  BuildFormText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: MyText(
        title: text,
        size: 11,
        color: MyColors.white,
      ),
    );
  }
}
