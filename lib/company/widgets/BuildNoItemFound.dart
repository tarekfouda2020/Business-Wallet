import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/widgets/MyText.dart';
import 'package:flutter/material.dart';

class BuildNoItemFound extends StatelessWidget {
  final String? title;

  const BuildNoItemFound({this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(
          flex: 2,
        ),
        MyText(
          title: title ?? "لا يوجد",
          size: 17,
          color: MyColors.primary,
        ),
        Spacer(
          flex: 3,
        ),
      ],
    );
  }
}
