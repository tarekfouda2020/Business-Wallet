part of 'CompActiveAccountWidgetsImports.dart';

class BuildButtonList extends StatelessWidget {
  final CompActiveAccountData compActiveAccountData;
  final String userId;

  const BuildButtonList(
      {required this.compActiveAccountData, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LoadingButton(
          btnKey: compActiveAccountData.btnKey,
          title: "تأكيد",
          onTap: () => compActiveAccountData.onActiveAccount(context, userId),
          color: MyColors.white,
          textColor: MyColors.black,
          borderRadius: 20,
          margin: const EdgeInsets.symmetric(
            vertical: 30,
          ),
        ),
        InkWell(
          onTap: () => compActiveAccountData.onResendCode(context, userId),
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
