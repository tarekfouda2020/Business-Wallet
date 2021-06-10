part of 'MainPageImports.dart';

class MainPageData {
  final GlobalKey<DropdownSearchState> city = new GlobalKey();
  final GlobalKey<DropdownSearchState> interest = new GlobalKey();
  final TextEditingController filter = new TextEditingController();
  final GenericCubit<String> filterCubit = new GenericCubit("0");

  int cityId = 0;
  int interestId = 0;

  void onSelectCities(CitiesModel model) {
    cityId = model.id!;
  }

  void onSelectInterest(UserInterestModel model) {
    interestId = model.id;
  }

  void selectType(String id, BuildContext context) {
    filterCubit.onUpdateData(id);
    AutoRouter.of(context).pop();
  }
//
// void setMainFiltered(BuildContext context) async {
//   FocusScope.of(context).requestFocus(FocusNode());
//
//   await CustomerRepository(context).getMainFiltered(
//       pageSize, cityId, interestId, int.parse(filterCubit.state.data));
// }

// final PagingController<int, MainModel> pagingController =
//     PagingController(firstPageKey: 1);
// late List<MainModel> mainData;
// int pageSize = 10;
//
// void fetchData(int pageIndex, BuildContext context) async {
//   mainData = await CustomerRepository(context).getMainFiltered(
//       pageSize, cityId, interestId, int.parse(filterCubit.state.data));
//   final isLastPage = mainData.length < pageSize;
//   if (isLastPage) {
//     pagingController.appendLastPage(mainData);
//   } else {
//     final nextPageKey = pageIndex + 1;
//     pagingController.appendPage(mainData, nextPageKey);
//   }
// }
}
