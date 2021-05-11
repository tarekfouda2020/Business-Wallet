part of 'ForgetPassEmailImports.dart';

class ForgetPasswordEmail extends StatefulWidget {
  @override
  _ForgetPasswordEmailState createState() => _ForgetPasswordEmailState();
}

class _ForgetPasswordEmailState extends State<ForgetPasswordEmail> {
  final ForgetPassEmailData forgetPassEmailData = new ForgetPassEmailData();

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        children: [
          HeaderLogo(),
          // BuildText(),
          BuildFormInputs(forgetPassEmailData: forgetPassEmailData),
          BuildButton(forgetPassEmailData: forgetPassEmailData),
        ],
      ),
    );
  }
}
