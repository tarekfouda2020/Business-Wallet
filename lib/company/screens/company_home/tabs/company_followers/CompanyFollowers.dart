part of 'CompanyFollowersImports.dart';

class CompanyFollowers extends StatefulWidget {
  @override
  _CompanyFollowersState createState() => _CompanyFollowersState();
}

class _CompanyFollowersState extends State<CompanyFollowers> {
  final CompanyFollowersData companyFollowersData = new CompanyFollowersData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: BuildAppBar(
        companyFollowersData: companyFollowersData,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(vertical: 20),
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: 4,
        itemBuilder: (_, index) {
          return BuildMainItem();
        },
      ),
    );
  }
}
