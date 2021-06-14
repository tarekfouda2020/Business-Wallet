part of 'FollowersImports.dart';

class FollowersData {
  final PagingController<int, FollowerModel> pagingController =
      PagingController(firstPageKey: 1);
  late List<FollowerModel> followerData;
  int pageSize = 10;
  int cityId = 0;
  int interestId = 0;
  int filterId = -1;

  void fetchPage(int pageIndex, BuildContext context) async {
    followerData = await CustomerRepository(context)
        .getFollowersFiltered(pageIndex, cityId, interestId, filterId);
    final isLastPage = followerData.length < pageSize;
    if (isLastPage) {
      pagingController.appendLastPage(followerData);
    } else {
      final nextPageKey = pageIndex + 1;
      pagingController.appendPage(followerData, nextPageKey);
    }
  }

  // void fetchPage(int pageIndex, BuildContext context) async {
  //   followerData =
  //   await CustomerRepository(context).getFollowersData(pageIndex);
  //   final isLastPage = followerData.length < pageSize;
  //   if (isLastPage) {
  //     pagingController.appendLastPage(followerData);
  //   } else {
  //     final nextPageKey = pageIndex + 1;
  //     pagingController.appendPage(followerData, nextPageKey);
  //   }
  // }

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
