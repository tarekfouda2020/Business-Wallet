part of 'FavoritesViewImports.dart';

class FavoritesViewData {
  final PagingController<int, FavoriteModel> pagingController =
      PagingController(firstPageKey: 1);
  late List<FavoriteModel> followerData;
  int pageSize = 10;

  void fetchPage(int pageIndex, int fkCity, fkInterest, String rate,
      BuildContext context) async {
    followerData = await CustomerRepository(context)
        .getFavoriteData(pageIndex, fkCity, fkInterest, rate);
    final isLastPage = followerData.length < pageSize;
    if (isLastPage) {
      pagingController.appendLastPage(followerData);
    } else {
      final nextPageKey = pageIndex + 1;
      pagingController.appendPage(followerData, nextPageKey);
    }
  }
}
