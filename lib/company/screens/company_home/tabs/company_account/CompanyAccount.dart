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
      appBar: DefaultAppBar(
        title: "حسابي",
        showLeading: false,
      ),
      body: Column(
        children: [
          BuildProfileCard(),
          Flexible(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 10),
              children: [
                BuildAccountDrop(companyAccountData: companyAccountData),
                BuildPublicDrop(companyAccountData: companyAccountData),
                BuildAccountItem(
                  title: "تواصل معنا",
                  iconData: Icons.phone_in_talk_outlined,
                  page: ContactUs(),
                ),
                BuildLogout()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
