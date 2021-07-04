part of 'CompanyMainImports.dart';

class CompanyMain extends StatefulWidget {
  final Function()? onTap;

  CompanyMain({this.onTap});

  @override
  _CompanyMainState createState() => _CompanyMainState();
}

class _CompanyMainState extends State<CompanyMain> {
  final CompanyMainData companyMainData = new CompanyMainData();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: HomeScaffold(
        search: BuildSelectedTabView(companyMainData: companyMainData),
        searchOnTap: widget.onTap,
        body: Column(
          children: [
            BuildMenuView(companyMainData: companyMainData),
            Flexible(
              child: TabBarView(
                children: [
                  MainMenu(companyMainData: companyMainData),
                  MapScreen(
                    mainPageData: companyMainData,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
