part of 'RegisterWidgetsImports.dart';

class BuildButton extends StatelessWidget {
  final RegisterData registerData;

  const BuildButton(this.registerData);

  @override
  Widget build(BuildContext context) {
    return LoadingButton(
      btnKey: registerData.btnKey,
      title: "انشاء حساب",
      onTap: () => registerData.setUserRegister(context),
      color: MyColors.white,
      textColor: MyColors.black,
      borderRadius: 20,
    );
  }
}
