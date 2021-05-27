part of 'CompanyRegisterInterestsImports.dart';

class CompanyRegisterInterests extends StatefulWidget {
  @override
  _CompanyRegisterInterestsState createState() =>
      _CompanyRegisterInterestsState();
}

class _CompanyRegisterInterestsState extends State<CompanyRegisterInterests> {
  final CompanyRegisterInterestsData companyRegisterInterestsData =
      new CompanyRegisterInterestsData();

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        physics: BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          HeaderLogo(),
          MyText(
            title: "حدد المجالات",
            size: 14,
            color: MyColors.white,
          ),
          BuildInterestForm(
            companyRegisterInterestsData: companyRegisterInterestsData,
          ),
          DefaultButton(
            title: "تأكيد",
            onTap: () => AutoRouter.of(context).push(LoginRoute()),
            color: MyColors.primary,
            textColor: MyColors.blackOpacity,
          ),
        ],
      ),
    );
  }
}
