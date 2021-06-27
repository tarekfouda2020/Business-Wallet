part of 'CompanyBrochureImports.dart';

class CompanyBrochure extends StatefulWidget {
  @override
  _CompanyBrochureState createState() => _CompanyBrochureState();
}

class _CompanyBrochureState extends State<CompanyBrochure> {
  final CompanyBrochureData companyBrochureData = new CompanyBrochureData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        title: "بيانات البروشور",
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        children: [
          BuildUserInfo(),
          BuildBrochureForm(companyBrochureData: companyBrochureData),
          LoadingButton(
            btnKey: companyBrochureData.btnKey,
            title: "حفظ",
            onTap: () => companyBrochureData.sendBrochureData(context),
            borderRadius: 30,
            color: MyColors.primary,
            textColor: MyColors.blackOpacity,
          )
        ],
      ),
    );
  }
}
