part of 'CompanySearchImports.dart';

class CompanySearchData {
  final TextEditingController search = TextEditingController();
  final GenericCubit<String?> searchUpdateCubit = new GenericCubit(null);

  Future<List<AutoSearchModel>> fetchAutoSearch(BuildContext context,String word) async {
    var autoSearch = await CompanyRepository(context).getAutoSearch(word);
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

  void fetchPage(int pageIndex, BuildContext context) async {
    List<MainModel> mainData = await CompanyRepository(context)
        .getMainSearch(pageIndex, filterId, fieldId, search.text);
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
