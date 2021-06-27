part of 'CompanyStatisticsRateImports.dart';

class CompanyStatisticsRateData {
  final GenericCubit<SpecificAdsDetailsModel?> specificDetailsCubit =
      new GenericCubit(null);
  final GenericCubit<ProductAdsDetailsModel?> productDetailsCubit =
      new GenericCubit(null);
  final GenericCubit<BusinessAdsDetailsModel?> businessDetailsCubit =
      new GenericCubit(null);

  void getSpecificAdsDetails(BuildContext context, int id) async {
    var data = await CompanyRepository(context).getSpecificAdsDetails(id);
    specificDetailsCubit.onUpdateData(data);
  }

  void getProductAdsDetails(BuildContext context, int id) async {
    var data = await CompanyRepository(context).getProductAdsDetails(id);
    productDetailsCubit.onUpdateData(data);
  }

  void getBusinessAdsDetails(BuildContext context, int id) async {
    var data = await CompanyRepository(context).getBusinessAdsDetails(id);
    businessDetailsCubit.onUpdateData(data);
  }
}
