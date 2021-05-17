part of 'CompanyHomeImports.dart';

class CompanyHomeData {
  final GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();
  late TabController tabController;

  void initController(TickerProvider tickerProvider) {
    tabController = TabController(length: 5, vsync: tickerProvider);
  }

  Future<bool> onBackPressed() async {
    SystemNavigator.pop();
    return true;
  }
}
