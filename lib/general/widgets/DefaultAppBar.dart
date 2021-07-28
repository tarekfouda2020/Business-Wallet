import 'package:base_flutter/res.dart';
import 'package:flutter/material.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/widgets/MyText.dart';

class DefaultAppBar extends PreferredSize {
  final String? title;
  final Widget? leading;
  final List<Widget>? actions;
  final Size preferredSize;
  final bool showLeading;

  DefaultAppBar({
    this.title,
    this.actions,
    this.leading,
    this.showLeading = true,
    this.preferredSize = const Size.fromHeight(kToolbarHeight + 15),
  }) : super(child: Container(), preferredSize: preferredSize);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyText(
            title: title ?? "",
            size: 14,
            color: MyColors.white,
          ),
          Visibility(
            visible: showLeading == false,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 45),
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
            replacement: Container(),
          )
        ],
      ),
      flexibleSpace: Container(
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
      ),
      centerTitle: false,
      backgroundColor: MyColors.darken,
      elevation: 0,
      leadingWidth: leading == null ? 10 : 55,
      leading: leading,
      actions: actions ??
          [
            Visibility(
              visible: showLeading == true,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 25,
                  color: MyColors.white,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              replacement: Container(),
            ),
          ],
    );
  }
}
