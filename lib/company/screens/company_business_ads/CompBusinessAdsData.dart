part of 'CompBusinessAdsImports.dart';

class CompBusinessAdsData {
  final GenericCubit<InvestmentAdsModel?> investmentAdsCubit =
      new GenericCubit(null);

  void fetchData(BuildContext context, int adsId) async {
    var data = await CompanyRepository(context).getInvestmentAds(adsId);
    investmentAdsCubit.onUpdateData(data);
  }
}
