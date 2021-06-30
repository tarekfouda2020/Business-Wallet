part of 'InvitationDetailsImports.dart';

class InvitationDetailsData {
  late AnimationController controller;
  late Animation<double> animation;
  Timer? timer;
  final GenericCubit<bool> commentCubit = GenericCubit(false);
  final GenericCubit<double> expandCubit = GenericCubit(0);
  final GenericCubit<bool> showExpandCubit = GenericCubit(false);
  final TextEditingController comment = TextEditingController();

  final GenericCubit<int> rateCubit = new GenericCubit(0);
  final GenericCubit<File?> imageCubit = new GenericCubit(null);

  final GenericCubit<SpecificAdsModel?> specificAdsCubit =
      new GenericCubit(null);

  void fetchData(BuildContext context, int adsId,{bool refresh=true}) async {
    var data = await CustomerRepository(context).getSpecificAds(adsId,refresh);
    specificAdsCubit.onUpdateData(data);
  }

  initAnimation(TickerProvider ticker, BuildContext context, int adsId,
      bool checkInvite, Function setState) {
    controller = AnimationController(
      vsync: ticker,
      duration: const Duration(
        milliseconds: 5000,
      ),
    );

    animation = Tween<double>(
      begin: 0,
      end: 40,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            expandCubit.onUpdateData(220);
            checkInvite
                ? Future.delayed(Duration(milliseconds: 500), () {
                    updateSpecificAds(context, adsId);
                    getSpecificAdsPoint(context, adsId);
                    showExpandCubit.onUpdateData(true);
                  })
                : Future.delayed(
                    Duration(milliseconds: 500),
                    () {
                      showExpandCubit.onUpdateData(true);
                    },
                  );
          }
        },
      );
    controller.forward();
  }

  void updateSpecificAds(BuildContext context, int adsId) async {
    await CustomerRepository(context)
        .updateSpecificAds(adsId)
        .then((value) => getSpecificAdsPoint(context, adsId));
  }

  void getSpecificAdsPoint(BuildContext context, int adsId) async {
    await CustomerRepository(context)
        .getSpecificAdsPoint(
            "0",
            specificAdsCubit.state.data!.previewAds.pointsForEachUser,
            adsId,
            "1")
        .then((value) => fetchData(context, adsId));
  }

  void addOrRemoveLike(BuildContext context, int adsId) async {
    await CustomerRepository(context)
        .likeSpecificAds(adsId, "1")
        .then((value) => fetchData(context, adsId));
  }

  void addOrRemoveFollow(
      BuildContext context, String kayanId, int adsId) async {
    await CustomerRepository(context)
        .addFollow(kayanId)
        .then((value) => fetchData(context, adsId));
  }

  void specificAdsRate(BuildContext context, int adsId, int rate) async {
    await CustomerRepository(context)
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
    await CustomerRepository(context)
        .specificAdsComment(adsId, comment.text, imageCubit.state.data, "1")
        .then((value) {
      comment.clear();
      imageCubit.onUpdateData(null);
      fetchData(context, adsId);
    });
  }

  void deleteComment(BuildContext context, int commentId) async {
    await CustomerRepository(context)
        .deleteComment(commentId)
        .then((value) => AutoRouter.of(context).pop());
  }
}
