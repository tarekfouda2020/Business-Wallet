part of 'ForgetPasswordCodeImports.dart';

class ForgetPasswordCode extends StatefulWidget {
  final String phone;
final String userId;
  const ForgetPasswordCode({required this.phone,required this.userId});

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

            margin: const EdgeInsets.symmetric(vertical: 20),
            onTap: () => forgetPasswordCodeData.forgetPasswordCode(
                context, widget.phone),
            btnKey: forgetPasswordCodeData.btnKey,
          ),
          InkWell(
            onTap: () => forgetPasswordCodeData.onResendCode(context,widget.userId),
            child: Center(
              child: MyText(
                title: "إعادة إرسال الكود",
                size: 13,
                color: MyColors.primary,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
