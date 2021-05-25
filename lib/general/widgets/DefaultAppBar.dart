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
          showLeading == false
              ? Image.asset(
                  Res.logo,
                  height: 30,
                )
              : Container()
        ],
      ),
      flexibleSpace: Image.asset(
        Res.bgheader,
        fit: BoxFit.fill,
      ),
      centerTitle: false,
      backgroundColor: MyColors.darken,
      elevation: 0,
      leadingWidth: leading == null ? 10 : 55,
      leading: leading,
      // leading: leading ??
      //     IconButton(
      //       icon: Icon(
      //         Icons.arrow_back,
      //         size: 25,
      //         color: MyColors.white,
      //       ),
      //       onPressed: () => Navigator.of(context).pop(),
      //     ),
      actions: actions ??
          [
            showLeading == true
                ? IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios_sharp,
                      size: 25,
                      color: MyColors.white,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  )
                : Container(),
          ],
    );
  }
}
