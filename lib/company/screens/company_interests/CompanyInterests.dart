part of 'CompanyInterestsImports.dart';

class CompanyInterests extends StatefulWidget {
  @override
  _CompanyInterestsState createState() => _CompanyInterestsState();
}

class _CompanyInterestsState extends State<CompanyInterests> {
  final CompanyInterestData companyInterestData = new CompanyInterestData();

  @override
  void initState() {
    companyInterestData.fetchData(context,refresh: false);
    companyInterestData.fetchData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        title: "الاهتمامات",
      ),
      body: Column(
        children: [
          BuildInterestText(),
          BuildInterestList(companyInterestData: companyInterestData),
          LoadingButton(
            btnKey: companyInterestData.btnKey,
            title: "تأكيد",
            onTap: () => companyInterestData.saveImportantData(context),
            borderRadius: 30,
            color: MyColors.primary,
            textColor: MyColors.blackOpacity,
          )
        ],
      ),
    );
  }
}
