part of 'CompActiveAccountImports.dart';

class CompActiveAccountData {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<CustomButtonState> btnKey =
      new GlobalKey<CustomButtonState>();
  final TextEditingController code = new TextEditingController();

  void onActiveAccount(BuildContext context, String userId) async {
    if (formKey.currentState!.validate()) {
      btnKey.currentState!.animateForward();
      var result = await GeneralRepository(context).compSendCode(code.text, userId);
      btnKey.currentState!.animateReverse();
      if (result) {
        AutoRouter.of(context).popAndPush(SuccessfullyActiveRoute(userId: userId));
      }
    }
  }
  void onResendCode(BuildContext context, String userId) async {
    await GeneralRepository(context).compResendCode(userId);
  }

  Future<bool> onBackPressed() async {
    SystemNavigator.pop();
    return true;
  }
}
