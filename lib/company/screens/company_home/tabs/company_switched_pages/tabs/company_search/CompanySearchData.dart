part of 'CompanySearchImports.dart';

class CompanySearchData {
  final GlobalKey<ScaffoldState> scaffold = new GlobalKey();
  final TextEditingController search = TextEditingController();
  final GenericCubit<String?> searchUpdateCubit = new GenericCubit(null);

  Future<List<AutoSearchModel>> fetchAutoSearch(
    BuildContext context,
    String word,
  ) async {
    var autoSearch = await CompanyRepository(context).getAutoSearch(word);
    return autoSearch;
  }

  void onSelectModel(BuildContext context, AutoSearchModel model) {
    FocusScope.of(context).requestFocus(FocusNode());
    searchUpdateCubit.onUpdateData(model.name);
    pagingController.refresh();
  }

  final PagingController<int, MainModel> pagingController =
      PagingController(firstPageKey: 1);

  int fieldId = 0;
  int subFieldId = 0;

  int filterId = 0;
  int pageSize = 10;

  void fetchPage(int pageIndex, BuildContext context,
      {bool refresh = true}) async {
    List<MainModel> mainData = await CompanyRepository(context)
        .getMainSearch(pageIndex, filterId, fieldId,subFieldId, search.text, refresh);
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
  void onSelectSubField(DropDownSelected? model) {
    if (model != null) subFieldId = model.id;
  }

  void selectType(FilterModel? model) {
    if (model != null) filterId = int.parse(model.id);
  }

  Future<List<MainModel>> fetchMapData(
      BuildContext context, double lat, double lng, double zoom) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;
    MapFilterModel model = new MapFilterModel(
      lang: lang,
      userId: userId,
      id: fieldId.toString(),
      searchId: filterId.toString(),
      topRate: filterId.toString(),
      lat: lat.toString(),
      lng: lng.toString(),
      type: "0",
      text: search.text,
      distance: Utils.determineDistance(zoom).toString(),
    );
    List<MainModel> data =
        await CompanyRepository(context).getMapProviders(model);
    return data;
  }
}
