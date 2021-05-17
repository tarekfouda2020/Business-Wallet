part of 'CompanyRegisterImports.dart';

class CompanyRegister extends StatefulWidget {
  @override
  _CompanyRegisterState createState() => _CompanyRegisterState();
}

class _CompanyRegisterState extends State<CompanyRegister> {
  final CompanyRegisterData companyRegisterData = new CompanyRegisterData();

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          HeaderLogo(),
          BuildCompRegisterForm(companyRegisterData: companyRegisterData),
          BuildTermsView(companyRegisterData: companyRegisterData),
          DefaultButton(
            title: "انشاء حساب",
            color: MyColors.white,
            textColor: MyColors.black,
            onTap: ()=>AutoRouter.of(context).push(ActiveAccountRoute(userId: "userId")),
            borderRadius: BorderRadius.circular(20),
            margin: const EdgeInsets.symmetric(vertical: 30),
          ),
          BuildLoginText()
        ],
      ),
    );
  }
}
