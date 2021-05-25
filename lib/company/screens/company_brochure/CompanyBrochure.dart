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
      body: Column(
        children: [
          Container(
            height: 190,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                DefaultAppBar(
                  title: "بيانات البروشور",
                ),
                BuildUserInfo(),
              ],
            ),
          ),
          Flexible(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              children: [
                BuildBrochureForm(companyBrochureData: companyBrochureData),
                DefaultButton(
                  title: "حفظ",
                  onTap: () {},
                  borderRadius: BorderRadius.circular(30),
                  color: MyColors.primary,
                  textColor: MyColors.blackOpacity,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
