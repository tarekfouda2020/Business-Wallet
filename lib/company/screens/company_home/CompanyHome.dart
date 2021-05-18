part of 'CompanyHomeImports.dart';

class CompanyHome extends StatefulWidget {
  final int index;

  const CompanyHome(this.index);

  @override
  _CompanyHomeState createState() => _CompanyHomeState();
}

class _CompanyHomeState extends State<CompanyHome>
    with SingleTickerProviderStateMixin {
  final CompanyHomeData companyHomeData = new CompanyHomeData();

  @override
  void initState() {
    companyHomeData.pageController = new TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: DefaultTabController(
        initialIndex: widget.index,
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
