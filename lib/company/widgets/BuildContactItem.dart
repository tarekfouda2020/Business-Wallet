import 'package:auto_route/auto_route.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/utilities/routers/RouterImports.gr.dart';
import 'package:base_flutter/general/widgets/MyText.dart';
import 'package:flutter/material.dart';

class BuildContactItem extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Color color;
  final String desc;
  final bool allLocation;
  final Function()? onTap;

  BuildContactItem(
      {required this.title,
      required this.iconData,
      required this.color,
      required this.desc,
      this.allLocation = true,this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          title: title,
          size: 10.5,
          color: MyColors.greyWhite.withOpacity(.9),
        ),
        InkWell(
          onTap:onTap,
          child: Column(
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
                  SizedBox(
                    width: 3,
                  ),
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
                replacement: InkWell(
                  onTap: ()=>AutoRouter.of(context).push(AllBranchesRoute()),
                  child: MyText(
                    title: "(مشاهدة جميع المواقع)",
                    size: 11,
                    color: MyColors.primary,
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
