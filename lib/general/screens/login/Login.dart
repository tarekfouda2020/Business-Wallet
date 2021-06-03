part of 'LoginImports.dart';

class Login extends StatefulWidget {
  final IntroModel? introModel;

  Login({this.introModel});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    print("_______@@@_____${widget.introModel?.kayanFour}");

    super.initState();
  }

  LoginData loginData = new LoginData();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: AuthScaffold(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            physics: BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            children: [
              HeaderLogo(),
              BuildText(),
              BuildFormInputs(loginData: loginData),
              BuildForgetText(),
              BuildLoginButton(loginData: loginData),
              BuildNewRegister(introModel: widget.introModel),
            ],
          ),
        ),
      ),
      onWillPop: loginData.onBackPressed,
    );
  }
}
