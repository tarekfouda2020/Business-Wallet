part of 'HomeImports.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin{
  HomeData homeData = HomeData();
  @override
  void initState() {
    homeData.initController(this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: DefaultTabController(
          initialIndex: 0,
          length: 5,
          child: Scaffold(
            floatingActionButton: BuildFloatingButton(homeData),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            body: BuildTabBarPages(homeData),
            bottomNavigationBar: BuildTabBody(homeData),
          ),
        ),

        onWillPop: homeData.onBackPressed
    );
  }
}
