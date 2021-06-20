part of 'CompanySearchImports.dart';

class CompanySearch extends StatefulWidget {
  final Function()? onTap;

  CompanySearch({this.onTap});

  @override
  _CompanySearchState createState() => _CompanySearchState();
}

class _CompanySearchState extends State<CompanySearch> {
  final CompanySearchData companySearchData = new CompanySearchData();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: HomeScaffold(
        search: BuildSelectedTabView(
          companySearchData: companySearchData,
        ),
        searchOnTap: widget.onTap,
        body: Column(
          children: [
            BuildSearchText(companySearchData: companySearchData),
            Flexible(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  CompSearchMenu(companySearchData: companySearchData,),
                  CompSearchMenu(companySearchData: companySearchData,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
