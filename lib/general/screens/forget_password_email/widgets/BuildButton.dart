part of 'ForgetPassEmailWidgetsImports.dart';

class BuildButton extends StatelessWidget {
  final ForgetPassEmailData forgetPassEmailData;

  const BuildButton({required this.forgetPassEmailData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LoadingButton(
          btnKey: forgetPassEmailData.btnKey,
          title: tr(context, "send"),
          onTap: () => forgetPassEmailData.onForgetPassword(context),
          color: MyColors.primary,
          textColor: MyColors.black,
          borderRadius: 20,
          margin: const EdgeInsets.symmetric(vertical: 30),
        ),
        DefaultButton(
          title: "استعادة عبر الهاتف",
          onTap: () => AutoRouter.of(context).push(ForgetPasswordRoute()),
          color: MyColors.white,
          borderRadius: BorderRadius.circular(17),
          textColor: MyColors.black,
          margin: EdgeInsets.zero,
        )
      ],
    );
  }
}
