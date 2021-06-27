part of 'CompSpecificAdsImports.dart';

class CompSpecificAds extends StatefulWidget {
  final int adsId;

  const CompSpecificAds({required this.adsId});

  @override
  _CompSpecificAdsState createState() => _CompSpecificAdsState();
}

class _CompSpecificAdsState extends State<CompSpecificAds> {
  final CompSpecificAdsData compSpecificAdsData = new CompSpecificAdsData();

  @override
  void initState() {
    compSpecificAdsData.fetchData(context, widget.adsId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        title: "تفاصيل الاعلان",
      ),
      body: BlocBuilder<GenericCubit<SpecificAdsModel?>,
          GenericState<SpecificAdsModel?>>(
        bloc: compSpecificAdsData.specificAdsCubit,
        builder: (_, state) {
          if (state is GenericUpdateState) {
            return ListView(
              padding: const EdgeInsets.symmetric(vertical: 20),
              children: [
                BuildAdsInfo(
                  adsDetailsModel: state.data!.previewAds,
                  compSpecificAdsData: compSpecificAdsData,
                  kayanOwnerModel: state.data!.kayanOwner,
                ),
                BuildInvTitle(title: "وصف الاعلان"),
                BuildAdsDescription(
                  desc: state.data!.previewAds.advertDescription,
                ),
                BuildInvTitle(title: "عروض"),
                BuildFile(
                  adsDetailsModel: state.data!.previewAds,
                ),
                BuildInvTitle(title: "الصور"),
                Visibility(
                  visible: state.data!.previewAds.images.isEmpty,
                  child: Center(
                    child: MyText(
                      title: "لا يوجد صور",
                    ),
                  ),
                  replacement: BuildSwiperView(
                    images: state.data!.previewAds.images,
                    adsDetailsModel: state.data!.previewAds,
                  ),
                ),
                BuildInvTitle(title: "الفيديوهات"),
                Visibility(
                  visible: state.data!.previewAds.videos.isEmpty,
                  child: Center(
                    child: MyText(
                      title: "لا يوجد فيديوهات",
                    ),
                  ),
                  replacement: BuildVideoView(),
                ),
                BuildInvTitle(title: "صاحب الإعلان"),
                BuildOwnerAds(
                  kayanOwnerModel: state.data!.kayanOwner,
                  adsDetailsModel: state.data!.previewAds,
                  compSpecificAdsData: compSpecificAdsData,
                ),
                BuildAdsComments(
                  compSpecificAdsData: compSpecificAdsData,
                  commentModel: state.data!.previewAds.comments,
                ),
                BuildAddRate(
                  compSpecificAdsData: compSpecificAdsData,
                  adsDetailsModel: state.data!.previewAds,
                )
              ],
            );
          } else {
            return Center(
              child: LoadingDialog.showLoadingView(),
            );
          }
        },
      ),
      bottomNavigationBar: BuildAddComments(
        compSpecificAdsData: compSpecificAdsData,
      ),
    );
  }
}
