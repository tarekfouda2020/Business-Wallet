part of 'SearchViewImports.dart';
class SearchViewData{
  final PagingController<int, MainModel> pagingController =
  PagingController(firstPageKey: 1);
  late List<MainModel> mainData;
  int pageSize = 10;

  void fetchPage(int pageIndex, BuildContext context) async {
    mainData = await CustomerRepository(context).getMainData(pageIndex);
    final isLastPage = mainData.length < pageSize;
    if (isLastPage) {
      pagingController.appendLastPage(mainData);
    } else {
      final nextPageKey = pageIndex + 1;
      pagingController.appendPage(mainData, nextPageKey);
    }
  }
}