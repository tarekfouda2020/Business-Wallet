part of 'HomeImports.dart';

class HomeData {

  late TabController tabController;

  void initController(TickerProvider tickerProvider, int index){
     tabController = TabController(length: 5, vsync: tickerProvider);
     tabController.index = index;
  }
  
  Future<bool> onBackPressed() async {
    SystemNavigator.pop();
    return true;
  }

}