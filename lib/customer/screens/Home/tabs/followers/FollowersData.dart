part of 'FollowersImports.dart';

class FollowersData {
  final PagingController<int, FollowerModel> pagingController =
      PagingController(firstPageKey: 1);
  late List<FollowerModel> followerData;
  int pageSize = 10;

  void fetchPage(int pageIndex, BuildContext context) async {
    followerData =
        await CustomerRepository(context).getFollowersData(pageIndex);
    final isLastPage = followerData.length < pageSize;
    if (isLastPage) {
      pagingController.appendLastPage(followerData);
    } else {
      final nextPageKey = pageIndex + 1;
      pagingController.appendPage(followerData, nextPageKey);
    }
  }
}
