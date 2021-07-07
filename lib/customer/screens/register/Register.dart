part of 'RegisterImports.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  RegisterData registerData = RegisterData();

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      child: ListView(
        padding:
            const EdgeInsets.only(top: 50, right: 20, left: 20, bottom: 20),
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        children: [
          HeaderLogo(),
          BuildRegisterInputs(registerData),
          BuildCheckTerms(registerData),
          BuildButton(registerData),
          BuildHaveAccount(registerData: registerData,)
        ],
      ),
    );
  }
}
