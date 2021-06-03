part of 'ForgetPasswordCodeImports.dart';

class ForgetPasswordCode extends StatefulWidget {
  final String phone;

  const ForgetPasswordCode({required this.phone});

  @override
  _ForgetPasswordCodeState createState() => _ForgetPasswordCodeState();
}

class _ForgetPasswordCodeState extends State<ForgetPasswordCode> {
  final ForgetPasswordCodeData forgetPasswordCodeData =
      new ForgetPasswordCodeData();

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        physics: BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          HeaderLogo(),
          BuildCodeForm(forgetPasswordCodeData: forgetPasswordCodeData),
          LoadingButton(
            title: "تأكيد",

            margin: const EdgeInsets.symmetric(vertical: 10),
            onTap: () => forgetPasswordCodeData.forgetPasswordCode(
                context, widget.phone),
            btnKey: forgetPasswordCodeData.btnKey,
          )
        ],
      ),
    );
  }
}
