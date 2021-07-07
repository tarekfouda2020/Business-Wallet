part of 'ForgetPasswordImports.dart';

class ForgerPasswordData {
  final GenericCubit<bool> showEmail = new GenericCubit(false);

  final GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<CustomButtonState> btnKey =
      new GlobalKey<CustomButtonState>();

  final TextEditingController phone = new TextEditingController();
  final TextEditingController email = new TextEditingController();

  // void onForgetPassword(BuildContext context) async {
  //   if (formKey.currentState!.validate()) {
  //     btnKey.currentState!.animateForward();
  //     await GeneralRepository(context).forgetPasswordByPhone(phone.text);
  //     btnKey.currentState!.animateReverse();
  //   }
  // }

  void onForgetPasswordByEmail(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      btnKey.currentState!.animateForward();
      await GeneralRepository(context).forgetPasswordByEmail(email.text);
      btnKey.currentState!.animateReverse();
    }
  }
}
