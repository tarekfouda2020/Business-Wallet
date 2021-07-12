part of 'FavoritesViewImports.dart';

class FavouriteViewData{

  final PagingController<int, FavoriteModel> pagingController =
  PagingController(firstPageKey: 1);
  int pageSize = 10;

  void fetchPage(int pageIndex,int city,int interest,int filter, BuildContext context,{bool refresh=true}) async {
    List<FavoriteModel> followerData = await CustomerRepository(context)
        .getFavoriteData(pageIndex, city, interest, "$filter",refresh);
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


}