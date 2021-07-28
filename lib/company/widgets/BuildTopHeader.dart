import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/widgets/MyText.dart';
import 'package:base_flutter/res.dart';
import 'package:flutter/material.dart';

class BuildTopHeader extends StatelessWidget {
  final String ?title;
  final bool search;
  final Function() ?onTap;

  BuildTopHeader({this.title,required this.search, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      height: 120,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Res.bgheader),
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(
            Colors.white24,
            BlendMode.softLight,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Visibility(
            visible: search,
            child: MyText(
              title: title??"",
              size: 14,
              color: MyColors.white,
            ),
            replacement: IconButton(
              icon: Icon(
                Icons.search,
                color: MyColors.white,
                size: 25,
              ),
              onPressed: onTap,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  Res.logo,
                  height: 40,
                ),
                MyText(
                  title: "الدليل التجاري الافضل",
                  size: 7,
                  color: MyColors.primary,
                )
              ],
            ),
          ),

        ],
      ),
    );
  }
}
