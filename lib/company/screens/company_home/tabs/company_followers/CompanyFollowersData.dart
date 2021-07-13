part of 'CompanyFollowersImports.dart';
class CompanyFollowersData {
  final GlobalKey<ScaffoldState> scaffold = new GlobalKey();
  final PagingController<int, FollowerModel> pagingController =
  PagingController(firstPageKey: 1);
  late List<FollowerModel> followerData;
  int pageSize = 10;
  int cityId = 0;
  int interestId = 0;
  int filterId = -1;

  void fetchPage(int pageIndex, BuildContext context,{bool refresh = true}) async {
    followerData = await CompanyRepository(context)
        .getFollowersFiltered(pageIndex, cityId, interestId, filterId,refresh);
    final isLastPage = followerData.length < pageSize;
    if (pageIndex==1) {
      pagingController.itemList=[];
    }
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
    if (model != null) filterId = int.parse(model.id);
  }
}