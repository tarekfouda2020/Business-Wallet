import 'package:auto_route/auto_route.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/utilities/routers/RouterImports.gr.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/MyText.dart';

class LoadingDialog {
  static showLoadingDialog() {
    EasyLoading.show(
        maskType: EasyLoadingMaskType.black,
        dismissOnTap: false,
        indicator: SpinKitCubeGrid(
          size: 40.0,
          itemBuilder: (context, index) {
            return Container(
              height: 10,
              width: 10,
              margin: EdgeInsets.all(1),
              decoration: BoxDecoration(
                  color: MyColors.primary, shape: BoxShape.circle),
            );
          },
        ),
        status: "loading");
  }

  static showLoadingView() {
    return Center(
      child: SpinKitCubeGrid(
        color: MyColors.primary,
        size: 40.0,
      ),
    );
  }

  static showConfirmDialog(
      {required BuildContext context,
      required String title,
      required Function() confirm}) {
    return showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return _alertDialog(title, confirm, context, "تأكيد");
      },
    );
  }

  static showAuthDialog({required BuildContext context}) {
    return showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return _alertDialog(
            "قم بتسجيل الدخول للمتابعة",
            () => context.router.popUntilRouteWithName(LoginRoute.name),
            context,
            "دخول");
      },
    );
  }

  static Widget _alertDialog(
      String title, Function() confirm, BuildContext context, String okText) {
    return CupertinoAlertDialog(
      title: MyText(
        title: title,
        size: 12,
        color: MyColors.black,
      ),
      // content: MyText(title: title,size: 12,color: MyColors.blackOpacity,),
      actions: [
        CupertinoDialogAction(
          child: MyText(
            title: "رجوع",
            size: 12,
            color: MyColors.blackOpacity,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        CupertinoDialogAction(
          child: MyText(
            title: okText,
            size: 12,
            color: MyColors.blackOpacity,
          ),
          onPressed: confirm,
        ),
      ],
    );
  }

  static showToastNotification(msg,
      {Color? color, Color? textColor, Alignment? alignment}) {
    BotToast.showSimpleNotification(
        title: msg,
        align: alignment ?? Alignment.bottomCenter,
        backgroundColor: color ?? MyColors.primary,
        titleStyle: TextStyle(color: textColor ?? MyColors.black,fontSize: 14,fontWeight: FontWeight.bold),
        duration: Duration(seconds: 3),
        hideCloseButton: false,
        closeIcon: Icon(
          Icons.close,
          size: 25,
          color: MyColors.black,
        ));
  }

  static showSimpleToast(msg) {
    BotToast.showText(text: msg,
      contentColor: MyColors.primary,
      textStyle: GoogleFonts.cairo(fontSize: 16,color: MyColors.black,fontWeight: FontWeight.bold)
    );
  }

  static showCustomToast(msg) {
    BotToast.showText(
      text: msg,
      contentColor: MyColors.blackOpacity,
      textStyle: TextStyle(color: MyColors.white, fontSize: 19),
      duration: Duration(seconds: 2),
      align: Alignment.center,
    );
  }
}
