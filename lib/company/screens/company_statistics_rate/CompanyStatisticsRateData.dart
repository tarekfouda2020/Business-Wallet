part of 'CompanyStatisticsRateImports.dart';

class CompanyStatisticsRateData {
  final GenericCubit<SpecificAdsDetailsModel?> specificDetailsCubit =
      new GenericCubit(null);
  final GenericCubit<ProductAdsDetailsModel?> productDetailsCubit =
      new GenericCubit(null);
  final GenericCubit<BusinessAdsDetailsModel?> businessDetailsCubit =
      new GenericCubit(null);

  final GenericCubit<BusinessAdsDetailsModel?> mainDetailsCubit =
      new GenericCubit(null);

  void initMethods(BuildContext context, int type, int id) async {
    if (type == 1) {
      getSpecificAdsDetails(context, id, refresh: false);
      getSpecificAdsDetails(context, id);
    } else if (type == 2) {
      getProductAdsDetails(context, id, refresh: false);
      getProductAdsDetails(context, id);
    } else if (type == 3) {
      getBusinessAdsDetails(context, id, refresh: false);
      getBusinessAdsDetails(context, id);
    } else {
      getMainAdsDetails(context, id, refresh: false);
      getMainAdsDetails(context, id);
    }
  }

  void getSpecificAdsDetails(BuildContext context, int id,
      {bool refresh = true}) async {
    var data =
        await CompanyRepository(context).getSpecificAdsDetails(id, refresh);
    specificDetailsCubit.onUpdateData(data);
  }

  void getProductAdsDetails(BuildContext context, int id,
      {bool refresh = true}) async {
    var data =
        await CompanyRepository(context).getProductAdsDetails(id, refresh);
    productDetailsCubit.onUpdateData(data);
  }

  void getBusinessAdsDetails(BuildContext context, int id,
      {bool refresh = true}) async {
    var data =
        await CompanyRepository(context).getBusinessAdsDetails(id, refresh);
    businessDetailsCubit.onUpdateData(data);
  }

  void getMainAdsDetails(BuildContext context, int id,
      {bool refresh = true}) async {
    var data = await CompanyRepository(context).getMainAdsDetails(id, refresh);
    mainDetailsCubit.onUpdateData(data);
  }


  void savePdfs(BuildContext context,int id,int type)async{
    if(type==1){
      saveSpecificPdf(context,id);
    }
  else  if(type==2){
      saveProductPdf(context, id);
    }
    else if(type==3){
      saveBusinessPdf(context, id);
    }
    else{
      saveMainPdf(context, id);
    }
  }
  void saveSpecificPdf(BuildContext context, int id) async {
    var data = await CompanyRepository(context).saveSpecificPdf(id);
    if (data != null) {
      Utils.launchURL(url: data);
    }
  }
  void saveBusinessPdf(BuildContext context, int id) async {
    var data = await CompanyRepository(context).saveBusinessPdf(id);
    if (data != null) {
      Utils.launchURL(url: data);
    }
  }
  void saveMainPdf(BuildContext context, int id) async {
    var data = await CompanyRepository(context).saveMainPdf(id);
    if (data != null) {
      Utils.launchURL(url: data);
    }
  }
  void saveProductPdf(BuildContext context, int id) async {
    var data = await CompanyRepository(context).saveProductPdf(id);
    if (data != null) {
      Utils.launchURL(url: data);
    }
  }

}
