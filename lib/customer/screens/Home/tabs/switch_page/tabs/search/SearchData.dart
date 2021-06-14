part of 'SearchImports.dart';

class SearchData {
  final PagingController<int, MainModel> pagingController =
      PagingController(firstPageKey: 1);
  final TextEditingController search = TextEditingController();

  int fieldId = 0;
  int filterId = 0;
  int pageSize = 10;

  void fetchPage(int pageIndex, BuildContext context) async {
    List<MainModel> mainData = await CustomerRepository(context)
        .getMainSearched(pageIndex, filterId, fieldId, search.text);
    final isLastPage = mainData.length < pageSize;
    if (isLastPage) {
      pagingController.appendLastPage(mainData);
    } else {
      final nextPageKey = pageIndex + 1;
      pagingController.appendPage(mainData, nextPageKey);
    }
  }

  void onSelectField(FieldDropDownModel? model) {
    if (model != null) fieldId = model.fieldId!;
  }

  void selectType(FilterModel? model) {
    if (model != null) filterId = int.parse(model.id);
  }
}
