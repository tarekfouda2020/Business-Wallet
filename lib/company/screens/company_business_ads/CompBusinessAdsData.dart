part of 'CompBusinessAdsImports.dart';

class CompBusinessAdsData {
  final GenericCubit<CompFavDetailsModel?> adsDetailsCubit =
      new GenericCubit(null);

  void fetchData(BuildContext context, int adsId) async {
    var data = await CompanyRepository(context).getAds(adsId, 1, 0);
    adsDetailsCubit.onUpdateData(data);
  }

  void addOrRemoveLikeAds(BuildContext context, int adsId) async {
    await CompanyRepository(context)
        .likeAds(adsId, "1")
        .then((value) => fetchData(context, adsId));
  }

  void addOrRemoveFollowAds(
    BuildContext context,
    String kayanId,
    int adsId,
  ) async {
    await CompanyRepository(context)
        .followAds(kayanId)
        .then((value) => fetchData(context, adsId));
  }
}
