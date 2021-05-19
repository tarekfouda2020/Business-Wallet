part of 'CompanySearchImports.dart';

class CompanySearch extends StatefulWidget {
  @override
  _CompanySearchState createState() => _CompanySearchState();
}

class _CompanySearchState extends State<CompanySearch> {
  final CompanySearchData companySearchData = new CompanySearchData();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: MyColors.darken,
        appBar: BuildAppBar(
          companySearchData: companySearchData,
        ),
        body: Column(
          children: [
            BuildSearchText(
              companySearchData: companySearchData,
            ),
            Flexible(
              child: TabBarView(
                children: [
                  CompSearchMenu(),
                  CompSearchMenu(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
