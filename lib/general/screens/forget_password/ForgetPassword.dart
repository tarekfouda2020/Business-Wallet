part of 'ForgetPasswordImports.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  ForgerPasswordData forgerPasswordData = new ForgerPasswordData();

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        children: [
          HeaderLogo(),
          // BuildText(),
          BuildFormInputs(forgerPasswordData: forgerPasswordData),
          BuildButton(forgerPasswordData: forgerPasswordData),
        ],
      ),
    );
  }
}
