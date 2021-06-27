part of 'CompSpecificAdsImports.dart';

class CompSpecificAds extends StatefulWidget {
  final int adsId;

  const CompSpecificAds({required this.adsId});

  @override
  _CompSpecificAdsState createState() => _CompSpecificAdsState();
}

class _CompSpecificAdsState extends State<CompSpecificAds>
    with SingleTickerProviderStateMixin {
  final CompSpecificAdsData compSpecificAdsData = new CompSpecificAdsData();

  @override
  void initState() {
    compSpecificAdsData.fetchData(context, widget.adsId);

    super.initState();
    if (compSpecificAdsData.isOwner.state.data == false) {
      compSpecificAdsData.controller = AnimationController(
        vsync: this,
        duration: const Duration(
          milliseconds: 5000,
        ),
      );

      compSpecificAdsData.animation = Tween<double>(
        begin: 0,
        end: 40,
      ).animate(CurvedAnimation(
          parent: compSpecificAdsData.controller, curve: Curves.easeOut))
        ..addListener(() {
          setState(() {});
        })
        ..addStatusListener(
          (status) {
            if (status == AnimationStatus.completed) {
              compSpecificAdsData.expandCubit.onUpdateData(220);
              Future.delayed(Duration(milliseconds: 500), () {
                print("_______${widget.adsId}");

                compSpecificAdsData.updateSpecificAds(context, widget.adsId);
                compSpecificAdsData.getSpecificAdsPoint(context, widget.adsId);
                compSpecificAdsData.showExpandCubit.onUpdateData(true);
              });
            }
          },
        );
      compSpecificAdsData.controller.forward();
    }
  }

  refreshPage() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: compSpecificAdsData.isOwner.state.data
          ? DefaultAppBar(
              title: "تفاصيل الاعلان",
            )
          : PreferredSize(
              child: Container(),
              preferredSize: Size.fromHeight(kToolbarHeight),
            ),
      body: BlocBuilder<GenericCubit<SpecificAdsModel?>,
          GenericState<SpecificAdsModel?>>(
        bloc: compSpecificAdsData.specificAdsCubit,
        builder: (_, state) {
          if (state is GenericUpdateState) {
            return Column(
              children: [
                Visibility(
                  visible: compSpecificAdsData.isOwner.state.data == false,
                  child: Container(
                    height: 180,
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        BuildInvAppBar(),
                        BuildAnimation(
                          adsDetailsModel: state.data!.previewAds,
                          compSpecificAdsData: compSpecificAdsData,
                        ),
                        BuildAnimationDetail(
                          compSpecificAdsData: compSpecificAdsData,
                          adsDetailsModel: state.data!.previewAds,
                        )
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: ListView(
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
                        replacement: BuildAdsVideoList(
                          videos: state.data!.previewAds.videos,
                        ),
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
                  ),
                ),
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
