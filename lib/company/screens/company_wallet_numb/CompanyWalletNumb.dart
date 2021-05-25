part of 'CompanyWalletNumbImports.dart';

class CompanyWalletNumb extends StatefulWidget {
  @override
  _CompanyWalletNumbState createState() => _CompanyWalletNumbState();
}

class _CompanyWalletNumbState extends State<CompanyWalletNumb> {
  final CompanyWalletNumbData companyWalletNumbData =
      new CompanyWalletNumbData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: companyWalletNumbData.scaffold,
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        title: "رقم المحفظة",
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        children: [
          BuildBenefitsText(),
          BuildCopyText(companyWalletNumbData: companyWalletNumbData),
        ],
      ),
    );
  }
}
