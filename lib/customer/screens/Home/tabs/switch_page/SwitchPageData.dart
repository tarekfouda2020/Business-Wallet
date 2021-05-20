part of 'SwitchPageImports.dart';

class SwitchPageData {
  GenericCubit<int> pagesCubit = new GenericCubit(0);
  List<Widget> data = [];

  initPagesData() {
    data = [
      MainPage(
        onTap:()=> pagesCubit.onUpdateData(1),
      ),
      Search(
        onTap:()=> pagesCubit.onUpdateData(0),
      ),
    ];
  }
}