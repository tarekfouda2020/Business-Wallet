part of 'ResetPasswordImports.dart';

class ResetPasswordData {
  GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<CustomButtonState> btnKey =
      new GlobalKey<CustomButtonState>();

  final GenericCubit<bool> showPass = new GenericCubit(true);
  final GenericCubit<bool> showConfirmPass = new GenericCubit(true);

  final TextEditingController newPassword = new TextEditingController();
  final TextEditingController confirmNewPassword = new TextEditingController();

  void onResetPassword(BuildContext context, String userId) async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (formKey.currentState!.validate()) {
      btnKey.currentState!.animateForward();
      bool result = await GeneralRepository(context)
          .resetUserPassword(userId, newPassword.text);
      btnKey.currentState!.animateReverse();
      if (result) {
        AutoRouter.of(context).popUntilRouteWithName(LoginRoute.name);
      }
    }
  }
}
