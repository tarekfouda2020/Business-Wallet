part of 'CompSwitchedPageImports.dart';

class CompSwitchedPageData {
  GenericCubit<int> pagesCubit = new GenericCubit(0);
  List<Widget> data = [];

  initPagesData() {
    data = [
      CompanyMain(
        onTap:()=> pagesCubit.onUpdateData(1),
      ),
      CompanySearch(
        onTap:()=> pagesCubit.onUpdateData(0),
      ),
    ];
  }
}
