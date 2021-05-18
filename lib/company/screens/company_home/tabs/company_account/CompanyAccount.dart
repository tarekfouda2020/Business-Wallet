part of 'CompanyAccountImports.dart';

class CompanyAccount extends StatefulWidget {
  @override
  _CompanyAccountState createState() => _CompanyAccountState();
}

class _CompanyAccountState extends State<CompanyAccount> {
  final CompanyAccountData companyAccountData = new CompanyAccountData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: BuildAppBar(
        companyAccountData: companyAccountData,
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 50),
        children: [
          BuildAccountDrop(
            companyAccountData: companyAccountData,
          ),
          BuildPublicDrop(
            companyAccountData: companyAccountData,
          ),
          BuildAccountItem(
            title: "تواصل معنا",
            iconData: Icons.phone_in_talk_outlined,
          ),
          BuildLogout()
        ],
      ),
    );
  }
}
