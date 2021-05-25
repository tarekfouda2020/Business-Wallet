part of 'CompanyWalletImports.dart';

class CompanyWallet extends StatefulWidget {
  @override
  _CompanyWalletState createState() => _CompanyWalletState();
}

class _CompanyWalletState extends State<CompanyWallet> {
  final CompanyWalletData companyWalletData = new CompanyWalletData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        title: "المحفظة",
      ),
      body: ListView(
        children: [
          BuildHelp(),
          BuildWalletText(),
          BuildPointsItem(title: "ارباح الدعوات التجارية", desc: "0"),
          BuildPointsItem(title: "ارباح الصفقات", desc: "0", showButton: true),
          BuildPointsItem(title: "ارباح المشاركة", desc: "0"),
          BuildPointsItem(
              title: "ارباح سوف تفقد بتاريخ", desc: "0", showText: true),
          BuildPrice(),
          BuildPriceForm(companyWalletData: companyWalletData),
          DefaultButton(
            title: "تصفية المحفظة",
            onTap: () {},
            color: MyColors.primary,
            textColor: MyColors.blackOpacity,
          )
        ],
      ),
    );
  }
}
