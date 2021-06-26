part of 'CompanyPackagesImports.dart';

class CompanyPackages extends StatefulWidget {
  @override
  _CompanyPackagesState createState() => _CompanyPackagesState();
}

class _CompanyPackagesState extends State<CompanyPackages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        title: "الباقات الاعلانية",
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 25),
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  BuildPackagesItem(),
                  BuildPackagesItem(),
                  BuildPackagesItem(),
                ],
              ),
              Column(
                children: [
                  BuildPackagesItem(),
                  BuildPackagesItem(),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
