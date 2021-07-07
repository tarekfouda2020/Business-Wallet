part of 'LoginImports.dart';

class LoginData {
  GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<CustomButtonState> btnKey =
      new GlobalKey<CustomButtonState>();
  final GenericCubit<bool> showPassword = new GenericCubit(true);

  final TextEditingController email = new TextEditingController();
  final TextEditingController password = new TextEditingController();

  void userLogin(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (formKey.currentState!.validate()) {
      btnKey.currentState!.animateForward();
      await GeneralRepository(context).setUserLogin(email.text, password.text);
      btnKey.currentState!.animateReverse();
    }
  }

  Future<bool> onBackPressed() async {
    SystemNavigator.pop();
    return true;
  }
}
