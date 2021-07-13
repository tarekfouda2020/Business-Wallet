part of 'CompanyMainImports.dart';

class CompanyMainData {
  final GlobalKey<ScaffoldState> scaffold = new GlobalKey();
  final PagingController<int, MainModel> pagingController =
  PagingController(firstPageKey: 1);
  int pageSize = 10;
  int cityId = 0;
  int interestId = 0;
  int filterId = 0;

  void fetchPage(int pageIndex, BuildContext context,{bool refresh = true}) async {
    List<MainModel> mainData = await CompanyRepository(context)
        .getMain(pageIndex,cityId,interestId,filterId,refresh);
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

  void onSelectInterest(UserInterestModel? model) {
    if (model != null) interestId = model.id;
  }

  void selectType(FilterModel? model) {
    if (model != null) filterId = int.parse(model.id);
  }

  Future<List<MainModel>> fetchMapData(BuildContext context,double lat,double lng , double zoom) async {
    var lang = context.read<LangCubit>().state.locale.languageCode;
    var userId = context.read<UserCubit>().state.model.companyModel!.userId;
    MapFilterModel model =new MapFilterModel(
      lang: lang,
      userId: userId,
      cityId: cityId.toString(),
      interests: interestId.toString(),
      topRate: filterId.toString(),
      type: "0",
      lat: lat.toString(),
      lng: lng.toString(),
      distance: Utils.determineDistance(zoom).toString(),
    );
    List<MainModel> data = await CompanyRepository(context)
        .getMapProviders(model);
    return data;
  }

}
