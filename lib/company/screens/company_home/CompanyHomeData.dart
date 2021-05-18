part of 'CompanyHomeImports.dart';

class CompanyHomeData {
  final GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();

  late TabController pageController;

  void onChangePage(int index) {
    pageController.animateTo(index,
        duration: Duration(milliseconds: 500), curve: Curves.bounceOut);
  }

  Future<bool> onBackPressed() async {
    SystemNavigator.pop();
    return true;
  }
}
