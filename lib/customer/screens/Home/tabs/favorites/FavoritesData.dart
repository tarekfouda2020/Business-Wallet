part of 'FavoritesImports.dart';

class FavoritesData {
  final PagingController<int, FavoriteModel> pagingController =
      PagingController(firstPageKey: 1);
  int pageSize = 10;
  int cityId = 0;
  int interestId = 0;
  String filterId = "M";

  void fetchPage(int pageIndex, BuildContext context) async {
    List<FavoriteModel> followerData = await CustomerRepository(context)
        .getFavoriteData(pageIndex, cityId, interestId, filterId);
    final isLastPage = followerData.length < pageSize;
    if (isLastPage) {
      pagingController.appendLastPage(followerData);
    } else {
      final nextPageKey = pageIndex + 1;
      pagingController.appendPage(followerData, nextPageKey);
    }
  }

  void onSelectCities(CitiesModel? model) {
    if (model != null) cityId = model.id;
  }

  void onSelectInterest(UserInterestModel? model) {
    if (model != null) interestId = model.id;
  }

  void selectType(FilterModel? model) {
    if (model != null) filterId = model.id;
  }
}
