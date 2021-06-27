part of 'CompSpecialSubscribeImports.dart';

class CompSpecialSubscribeData{
  late final PageController controller;
  final GenericCubit<int> subscribeCubit = new GenericCubit(0);

  void movePage(int page) {
    controller.animateToPage(page,
        duration: Duration(milliseconds: 500), curve: Curves.easeOut);
  }
}