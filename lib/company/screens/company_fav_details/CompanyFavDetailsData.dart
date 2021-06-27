part of 'CompanyFavDetailsImports.dart';

class CompanyFavDetailsData {
  final GenericCubit<bool> isOwner = new GenericCubit(true);

  late AnimationController controller;
  late Animation<double> animation;
  Timer? timer;
  final GenericCubit<bool> commentCubit = GenericCubit(false);
  final GenericCubit<double> expandCubit = GenericCubit(0);
  final GenericCubit<bool> showExpandCubit = GenericCubit(false);
  final TextEditingController comment = TextEditingController();

  final GenericCubit<int> rateCubit = new GenericCubit(0);

  final GenericCubit<CompFavDetailsModel?> adsDetailsCubit =
      new GenericCubit(null);

  void fetchData(
      BuildContext context, int adsId, int sendCard, int showSendCard) async {
    var data =
        await CompanyRepository(context).getAds(adsId, sendCard, showSendCard);
    adsDetailsCubit.onUpdateData(data);
    // isOwner.onUpdateData(data!.isOwner);

  }

  void updateAds(
      BuildContext context, int adsId, int showSend, int showSendCard) async {
    await CompanyRepository(context)
        .updateAds(adsId, showSend)
        .then((value) => getAdsPoint(context, adsId, showSend, showSendCard));
  }

  void getAdsPoint(
      BuildContext context, int adsId, int sendCard, int showSendCard) async {
    await CompanyRepository(context)
        .getAdsPoint(
            "0", adsDetailsCubit.state.data!.pointsForEachUser, adsId, "1")
        .then((value) => fetchData(context, adsId, sendCard, showSendCard));
  }

  void addOrRemoveLikeAds(
      BuildContext context, int adsId, int showSend, int showSendCard) async {
    await CompanyRepository(context)
        .likeAds(adsId, "1")
        .then((value) => fetchData(context, adsId, showSend, showSendCard));
  }

  void addOrRemoveFollowAds(BuildContext context, String kayanId, int adsId,
      int showSend, int showSendCard) async {
    await CompanyRepository(context)
        .followAds(kayanId)
        .then((value) => fetchData(context, adsId, showSend, showSendCard));
  }
}
