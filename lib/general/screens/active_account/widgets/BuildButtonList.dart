part of 'ActiveAccountWidgetsImports.dart';

class BuildButtonList extends StatelessWidget {
  final ActiveAccountData activeAccountData;
  final String userId;

  const BuildButtonList(
      {required this.activeAccountData, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LoadingButton(
          btnKey: activeAccountData.btnKey,
          title: tr(context, "confirm"),
          onTap: () => activeAccountData.onActiveAccount(context, userId),
          color: MyColors.white,
          textColor: MyColors.black,
          borderRadius: 20,
          margin: const EdgeInsets.symmetric(
            vertical: 30,
          ),
        ),
        InkWell(
          onTap: () => activeAccountData.onResendCode(context, userId),
          child: MyText(
            title: "إعادة إرسال الكود",
            size: 13,
            color: MyColors.primary,
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    );
  }
}
