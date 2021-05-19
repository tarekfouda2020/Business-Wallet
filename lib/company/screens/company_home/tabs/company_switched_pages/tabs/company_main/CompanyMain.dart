part of 'CompanyMainImports.dart';

class CompanyMain extends StatefulWidget {
  final Function()? onTap;

  CompanyMain({this.onTap});

  @override
  _CompanyMainState createState() => _CompanyMainState();
}

class _CompanyMainState extends State<CompanyMain>
    with SingleTickerProviderStateMixin {
  final CompanyMainData companyMainData = new CompanyMainData();

  @override
  void initState() {
    companyMainData.pageController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: MyColors.darken,
        appBar: BuildAppBar(
          companyMainData: companyMainData,
          onTap: widget.onTap,
        ),
        body: Column(
          children: [
            BuildMenuView(
              companyMainData: companyMainData,
            ),
            Flexible(
              child: TabBarView(
                children: [
                  MainMenu(),
                  MainMenu(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
