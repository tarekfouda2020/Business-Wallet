part of 'CompanyRegisterInterestsImports.dart';

class CompanyRegisterInterests extends StatefulWidget {
  final String userId;

  CompanyRegisterInterests({required this.userId});

  @override
  _CompanyRegisterInterestsState createState() =>
      _CompanyRegisterInterestsState();
}

class _CompanyRegisterInterestsState extends State<CompanyRegisterInterests> {
  final CompanyRegisterInterestsData companyRegisterInterestsData =
      new CompanyRegisterInterestsData();

  @override
  void initState() {
    print("_____${widget.userId}");
    super.initState();
  }

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
          LoadingButton(
            btnKey: companyRegisterInterestsData.btnKey,
            title: "تأكيد",
            onTap: () => companyRegisterInterestsData.saveImportantData(
                context, widget.userId),
            color: MyColors.primary,
            textColor: MyColors.blackOpacity,
          ),
        ],
      ),
    );
  }
}
