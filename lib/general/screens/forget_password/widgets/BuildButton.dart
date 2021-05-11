part of 'ForgetPasswordWidgetsImports.dart';

class BuildButton extends StatelessWidget {
  final ForgerPasswordData forgerPasswordData;

  const BuildButton({required this.forgerPasswordData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LoadingButton(
          btnKey: forgerPasswordData.btnKey,
          title: tr(context, "send"),
          onTap: () => forgerPasswordData.onForgetPassword(context),
          color: MyColors.primary,
          textColor: MyColors.black,
          borderRadius: 20,
          margin: const EdgeInsets.symmetric(vertical: 30),
        ),
        DefaultButton(
          title: "استعادة عبر البريد الالكتروني",
          onTap: () {},
          color: MyColors.white,
          textColor: MyColors.black,
          margin: EdgeInsets.zero,
        )
      ],
    );
  }
}
