part of 'MainPageImports.dart';

class MainPageData {
  final GlobalKey<ScaffoldState> scaffold = new GlobalKey();
  final PagingController<int, MainModel> pagingController =
      PagingController(firstPageKey: 1);
  late TabController tabController ;
  final MapScreenData mapScreenData = new MapScreenData();

  int pageSize = 10;
  int cityId = 0;
  // int interestId = 0;
  int filterId = 0;
  int fieldId = 0;

  Future<void> fetchPage(int pageIndex, BuildContext context,
      {bool refresh = true}) async {
    List<MainModel> mainData = await CustomerRepository(context)
        .getMainFiltered(pageIndex, cityId, fieldId, filterId,refresh);
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

  void onSelectCities(CitiesModel? model) {
    if (model != null) cityId = model.id;
  }

  // void onSelectInterest(UserInterestModel? model) {
  //   if (model != null) interestId = model.id;
  // }

  void selectType(FilterModel? model) {
    if (model != null) filterId = int.parse(model.id);
  }
  void onSelectField(FieldDropDownModel? model) {
    if (model != null) fieldId = model.fieldId!;
  }

  Future<List<MainModel>> fetchMapData(BuildContext context,double lat,double lng , double zoom) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.customerModel!.userId;
    MapFilterModel model =new MapFilterModel(
      lang: lang,
      userId: userId,
      cityId: cityId.toString(),
      interests: fieldId.toString(),
      topRate: filterId.toString(),
      lat: lat.toString(),
      lng: lng.toString(),
      distance: Utils.determineDistance(zoom).toString(),
    );
    List<MainModel> data = await CustomerRepository(context)
        .getMapProviders(model);
    return data;
  }

  refreshCurrentPage(BuildContext context, MainPageData mainPageData)async{
    if (tabController.index==0) {
      pagingController.refresh();
    }else{
      LoadingDialog.showLoadingDialog();
      await mapScreenData.fetchPage(context, mainPageData);
      EasyLoading.dismiss();
    }

  }


}
