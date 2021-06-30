part of 'SearchImports.dart';

class SearchData {
  final TextEditingController search = TextEditingController();
  final GenericCubit<String?> searchUpdateCubit = new GenericCubit(null);

  Future<List<AutoSearchModel>> fetchAutoSearch(BuildContext context,String word) async {
    var autoSearch = await CustomerRepository(context).getAutoSearch(word);
    return autoSearch;
  }

  void onSelectModel(BuildContext context,AutoSearchModel model) {
    FocusScope.of(context).requestFocus(FocusNode());
    searchUpdateCubit.onUpdateData(model.name);
    pagingController.refresh();
  }

  final PagingController<int, MainModel> pagingController =
      PagingController(firstPageKey: 1);

  int fieldId = 0;
  int filterId = 0;
  int pageSize = 10;

  void fetchPage(int pageIndex, BuildContext context, {bool refresh=true}) async {
    List<MainModel> mainData = await CustomerRepository(context)
        .getMainSearched(pageIndex, filterId, fieldId, search.text,refresh);
    final isLastPage = mainData.length < pageSize;
    if (pageIndex==1) {
      pagingController.itemList=[];
    }
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
