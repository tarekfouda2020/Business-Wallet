
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/widgets/MyText.dart';
import 'package:flutter/material.dart';

class BuildContactItem extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Color color;
  final String desc;
  final bool allLocation;

  BuildContactItem(this.title, this.iconData, this.color, this.desc,
      {this.allLocation = true});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
              title: title,
              size: 10.5,
              color: MyColors.greyWhite.withOpacity(.9),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      iconData,
                      color: color,
                      size: 13,
                    ),
                    SizedBox(width: 3,),
                    MyText(
                      title: desc,
                      size: 10,
                      color: MyColors.grey,
                    ),
                  ],
                ),
                Visibility(
                  visible: allLocation,
                  child: Container(),
                  replacement: MyText(
                    title: "(مشاهدة جميع المواقع)",
                    size: 11,
                    color: MyColors.primary,
                    decoration: TextDecoration.underline,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
