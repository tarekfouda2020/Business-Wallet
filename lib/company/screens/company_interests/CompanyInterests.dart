part of 'CompanyInterestsImports.dart';

class CompanyInterests extends StatefulWidget {
  @override
  _CompanyInterestsState createState() => _CompanyInterestsState();
}

class _CompanyInterestsState extends State<CompanyInterests> {
  final CompanyInterestData companyInterestData = new CompanyInterestData();

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
          DefaultButton(
            title: "تأكيد",
            onTap: () {},
            color: MyColors.primary,
            borderRadius: BorderRadius.circular(30),
            textColor: MyColors.blackOpacity,
          )
        ],
      ),
    );
  }
}
