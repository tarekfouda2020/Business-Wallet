part of 'ChangePasswordImports.dart';

class ChangePasswordData {
  final GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  final TextEditingController oldPassword = new TextEditingController();
  final TextEditingController newPassword = new TextEditingController();
  final TextEditingController confirmNewPassword = new TextEditingController();

  final GlobalKey<CustomButtonState> btnKey =
      new GlobalKey<CustomButtonState>();

  void changePassword(BuildContext context, String userId) async {
    if (formKey.currentState!.validate()) {
      btnKey.currentState!.animateForward();
      var result = await CustomerRepository(context)
          .changePassword(oldPassword.text, newPassword.text, userId);
      btnKey.currentState!.animateReverse();
      if (result) {
        AutoRouter.of(context).pop();
      }
    }
  }
}
