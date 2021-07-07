part of 'ForgetPasswordCodeImports.dart';

class ForgetPasswordCodeData {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<CustomButtonState> btnKey =
      new GlobalKey<CustomButtonState>();

  final TextEditingController code = new TextEditingController();

  void onResendCode(BuildContext context,String userId ) async {
    await GeneralRepository(context).resendCode(userId);
  }

  void forgetPasswordCode(BuildContext context, String phone) async {
    if (formKey.currentState!.validate()) {
      btnKey.currentState!.animateForward();
      await GeneralRepository(context).forgetPasswordCode(phone, code.text);
      btnKey.currentState!.animateReverse();
    }
  }
}
