part of 'RegisterWidgetsImports.dart';

class BuildButton extends StatelessWidget {
  final RegisterData registerData;
  const BuildButton(this.registerData);
  @override
  Widget build(BuildContext context) {
    return LoadingButton(
      title: "انشاء حساب",
      onTap: ()=> AutoRouter.of(context).push(ActiveAccountRoute(userId: "0")),
      btnKey: registerData.btnKey,
      color: MyColors.white,
      textColor: MyColors.black,
      borderRadius: 20,
    );
  }
}
