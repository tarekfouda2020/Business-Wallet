import 'package:base_flutter/general/constants/CustomButtonAnimation.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'MyText.dart';

class LoadingButton extends StatelessWidget {
  final GlobalKey<CustomButtonState> btnKey;
  final String title;
  final Function() onTap;
  final Color? textColor;
  final Color? color;
  final Color? borderColor;
  final double? borderRadius;
  final EdgeInsets? margin;
  final double? width;

  LoadingButton(
      {required this.title,
      required this.onTap,
      this.color,
      this.textColor,
      this.borderRadius,
      this.margin,
      this.borderColor,
      this.width,
      required this.btnKey});

  @override
  Widget build(BuildContext context) {
    Color border = color ?? MyColors.primary;
    return Container(
      margin:
          margin ?? const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          CustomButtonAnimation(
            key: btnKey,
            onTap: onTap,
            width: width ?? MediaQuery.of(context).size.width,
            minWidth: 50,
            height: 50,
            roundLoadingShape: true,
            color: color ?? MyColors.primary,
            borderRadius: borderRadius ?? 30,
            borderSide: BorderSide(color: borderColor ?? border, width: 1),
            child: MyText(
              title: "$title",
              size: 11,
              color: textColor ?? MyColors.white,
            ),
            loader: Container(
              padding: EdgeInsets.all(10),
              child: SpinKitRotatingCircle(
                color: Colors.black,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
