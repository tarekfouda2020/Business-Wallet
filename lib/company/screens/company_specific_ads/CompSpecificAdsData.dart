part of 'CompSpecificAdsImports.dart';

class CompSpecificAdsData {

  final GenericCubit<bool> commentCubit = GenericCubit(false);

  final GenericCubit<int> rateCubit = new GenericCubit(0);
  final GenericCubit<SpecificAdsModel?> specificAdsCubit =
      new GenericCubit(null);
  final GenericCubit<File?> imageCubit = new GenericCubit(null);
  final TextEditingController comment = TextEditingController();
  final GenericCubit<bool> isOwner = new GenericCubit(true);


  void fetchData(BuildContext context, int adsId) async {
    var data = await CompanyRepository(context).getSpecificAds(adsId);
    specificAdsCubit.onUpdateData(data);
    isOwner.onUpdateData(data!.previewAds.isOwner);
  }

  void updateSpecificAds(BuildContext context, int adsId) async {
    await CompanyRepository(context)
        .updateSpecificAds(adsId)
        .then((value) => getSpecificAdsPoint(context, adsId));
  }

  void getSpecificAdsPoint(BuildContext context, int adsId) async {
    print(
        "==============${specificAdsCubit.state.data!.previewAds.pointsForEachUser}");
    await CompanyRepository(context)
        .getSpecificAdsPoint(
            "0",
            specificAdsCubit.state.data!.previewAds.pointsForEachUser,
            adsId,
            "1")
        .then((value) => fetchData(context, adsId));
  }

  void addOrRemoveLike(BuildContext context, int adsId) async {
    await CompanyRepository(context)
        .likeSpecificAds(adsId, "1")
        .then((value) => fetchData(context, adsId));
  }

  void addOrRemoveFollow(
      BuildContext context, String kayanId, int adsId) async {
    await CompanyRepository(context)
        .addFollow(kayanId)
        .then((value) => fetchData(context, adsId));
  }

  void specificAdsRate(BuildContext context, int adsId, int rate) async {
    await CompanyRepository(context)
        .specificAdsRate(adsId, rate, "1")
        .then((value) => fetchData(context, adsId));
  }

  void setImage() async {
    var image = await Utils.getImage();
    if (image != null) {
      imageCubit.onUpdateData(image);
    }
  }

  void deleteImage() {
    imageCubit.onUpdateData(null);
  }

  void specificAdsComment(BuildContext context, int adsId) async {
    await CompanyRepository(context)
        .specificAdsComment(adsId, comment.text, imageCubit.state.data, "1")
        .then((value) {
      comment.clear();
      imageCubit.onUpdateData(null);
      fetchData(context, adsId);
    });
  }

  void deleteComment(BuildContext context, int commentId) async {
    await CompanyRepository(context)
        .deleteComment(commentId)
        .then((value) => AutoRouter.of(context).pop());
  }
}
