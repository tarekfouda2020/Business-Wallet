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
    GlobalNotification.instance.setupNotification(context);
    companyHomeData.initController(this, widget.index);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: DefaultTabController(
        initialIndex: widget.index,
        length: 5,
        child: Scaffold(
          extendBody: true,
          key: companyHomeData.scaffold,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: BuildFloatButton(
            companyHomeData: companyHomeData,
          ),
          body: BuildTabBarPages(companyHomeData: companyHomeData),
          bottomNavigationBar: BuildTabBarBody(
            companyHomeData: companyHomeData,
            index: widget.index,
          ),
        ),
      ),
      onWillPop: companyHomeData.onBackPressed,
    );
  }
}
