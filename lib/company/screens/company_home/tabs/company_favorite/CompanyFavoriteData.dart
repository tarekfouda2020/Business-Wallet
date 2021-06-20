part of 'CompanyFavoriteImports.dart';

class CompanyFavoriteData {
  final PagingController<int, CompFavoriteModel> pagingController =
  PagingController(firstPageKey: 1);
  int pageSize = 10;
  int cityId = 0;
  int interestId = 0;

  void fetchPage(int pageIndex, BuildContext context) async {
    List<CompFavoriteModel> followerData = await CompanyRepository(context)
        .getFavoriteData(pageIndex, cityId, interestId);
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


}
