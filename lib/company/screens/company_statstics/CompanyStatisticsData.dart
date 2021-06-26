part of 'CompanyStatisticsImports.dart';

class CompanyStatisticsData {
  final GenericCubit<CompStatisticsDetailsModel?> statisticsCubit =
      new GenericCubit(null);

  void fetchData(BuildContext context) async {
    var data = await CompanyRepository(context).getStatistics();
    statisticsCubit.onUpdateData(data);
  }

  void navigate(BuildContext context, int value, int type, int id) {
    if (value == 0) {
      AutoRouter.of(context).push(CompanyStatisticsRateRoute());
    } else {
      if (type == 1) {
        AutoRouter.of(context).push(CompSpecificAdsRoute(adsId: id));
      }
      if (type == 2) {
        AutoRouter.of(context).push(CompProductAdsRoute(adsId: id));
      }
      if (type == 3) {
        AutoRouter.of(context).push(CompanyFavDetailsRoute(
          adsId: id,
          checkInvite: false,
          showSendCard: 1,
          sendCard: 0,
        ));
      }
    }
  }
}
