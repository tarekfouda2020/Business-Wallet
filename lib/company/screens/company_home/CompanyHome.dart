part of 'CompanyHomeImports.dart';

class CompanyHome extends StatefulWidget {
  @override
  _CompanyHomeState createState() => _CompanyHomeState();
}

class _CompanyHomeState extends State<CompanyHome>
    with TickerProviderStateMixin {
  final CompanyHomeData companyHomeData = new CompanyHomeData();

  @override
  void initState() {
    companyHomeData.initController(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: DefaultTabController(
        initialIndex: 0,
        length: 5,
        child: Scaffold(
          key: companyHomeData.scaffold,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: BuildFloatButton(
            companyHomeData: companyHomeData,
          ),
          body: BuildTabBarPages(companyHomeData: companyHomeData),
          bottomNavigationBar:
              BuildTabBarBody(companyHomeData: companyHomeData),
        ),
      ),
      onWillPop: companyHomeData.onBackPressed,
    );
  }
}
