part of 'CompanyInvitationImports.dart';

class CompanyInvitationData {
  late TabController pageController;

  void onChangePage(int index) {
    pageController.animateTo(index,
        duration: Duration(milliseconds: 500), curve: Curves.bounceOut);
  }
}
