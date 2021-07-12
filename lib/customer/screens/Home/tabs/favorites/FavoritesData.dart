part of 'FavoritesImports.dart';

class FavoritesData {
  final GlobalKey<ScaffoldState> scaffold = new GlobalKey();
  final PagingController<int, FavoriteModel> pagingController =
      PagingController(firstPageKey: 1);
  final MapScreenData mapScreenData = new MapScreenData();

  final GenericCubit<int> pagesCubit = new GenericCubit(0);
  int pageSize = 10;
  int cityId = 0;
  int interestId = 0;
  String filterId = "M";

  List<Widget> data = [];

  initPagesData(FavoritesData favoritesData) {
    data = [
      FavoritesView(favoritesData: favoritesData),
      MapScreen(favoritesData: favoritesData),
    ];
  }


  void fetchPage(int pageIndex, BuildContext context,{bool refresh=true}) async {
    List<FavoriteModel> followerData = await CustomerRepository(context)
        .getFavoriteData(pageIndex, cityId, interestId, filterId, refresh);
    final isLastPage = followerData.length < pageSize;
    if (pageIndex == 1) {
      pagingController.itemList = [];
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
    if (model != null) filterId = model.id;
  }

  Future<List<FavoriteModel>> fetchMapPage(BuildContext context,{bool refresh=true}) async {
    List<FavoriteModel> followerData = await CustomerRepository(context)
        .getFavoriteData(1, cityId, interestId, filterId,refresh);
    return followerData;
  }

  refreshCurrentPage(BuildContext context, FavoritesData favoritesData)async {
    if (pagesCubit.state.data == 0) {
      pagingController.refresh();
    } else {
      LoadingDialog.showLoadingDialog();
      await mapScreenData.fetchPage(context, favoritesData);
      EasyLoading.dismiss();
    }
  }

}
