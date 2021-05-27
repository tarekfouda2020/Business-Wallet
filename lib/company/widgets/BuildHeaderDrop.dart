import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/widgets/MyText.dart';
import 'package:flutter/material.dart';

class BuildHeaderDrop extends StatelessWidget {
  final String title;

  const BuildHeaderDrop({required this.title});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          child: Row(
            children: [
              Flexible(
                child: MyText(
                  title: title,
                  size: 8,
                  color: MyColors.white,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.arrow_drop_down_outlined,
                size: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
