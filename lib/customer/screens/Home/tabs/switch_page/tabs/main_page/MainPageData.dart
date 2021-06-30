part of 'MainPageImports.dart';

class MainPageData {
  final PagingController<int, MainModel> pagingController =
      PagingController(firstPageKey: 1);
  int pageSize = 10;
  int cityId = 0;
  int interestId = 0;
  int filterId = 0;

  void fetchPage(int pageIndex, BuildContext context,
      {bool refresh = true}) async {
    List<MainModel> mainData = await CustomerRepository(context)
        .getMainFiltered(pageIndex, cityId, interestId, filterId,refresh);
    final isLastPage = mainData.length < pageSize;
    if (pageIndex==1) {
      pagingController.itemList=[];
    }
    if (isLastPage) {
      pagingController.appendLastPage(mainData);
    } else {
      final nextPageKey = pageIndex + 1;
      pagingController.appendPage(mainData, nextPageKey);
    }
  }

  void onSelectCities(CitiesModel? model) {
    if (model != null) cityId = model.id;
  }

  void onSelectInterest(UserInterestModel? model) {
    if (model != null) interestId = model.id;
  }

  void selectType(FilterModel? model) {
    if (model != null) filterId = int.parse(model.id);
  }
}
