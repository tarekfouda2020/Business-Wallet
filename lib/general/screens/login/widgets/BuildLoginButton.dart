part of 'LoginWidgetsImports.dart';

class BuildLoginButton extends StatelessWidget {
  final LoginData loginData;

  const BuildLoginButton({required this.loginData});

  @override
  Widget build(BuildContext context) {
    return LoadingButton(
      btnKey: loginData.btnKey,
      title: tr(context, "login"),
      // onTap: () => AutoRouter.of(context).push(CompanyHomeRoute()),
      onTap: () => loginData.userLogin(context),
      color: MyColors.white,
      textColor: MyColors.black,
      margin: const EdgeInsets.symmetric(vertical: 10),
    );
  }
}
