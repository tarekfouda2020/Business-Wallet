part of 'HomeImports.dart';

class HomeData {

  late TabController tabController;

  void initController(TickerProvider tickerProvider){
     tabController = TabController(length: 5, vsync: tickerProvider);
  }
  
  Future<bool> onBackPressed() async {
    SystemNavigator.pop();
    return true;
  }

}