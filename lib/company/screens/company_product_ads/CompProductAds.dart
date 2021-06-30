part of 'CompProductAdsImports.dart';

class CompProductAds extends StatefulWidget {
  final int adsId;

  const CompProductAds({required this.adsId});

  @override
  _CompProductAdsState createState() => _CompProductAdsState();
}

class _CompProductAdsState extends State<CompProductAds> {
  final CompProductAdsData compProductAdsData = new CompProductAdsData();

  @override
  void initState() {
    compProductAdsData.fetchData(context, widget.adsId, refresh: false);

    compProductAdsData.fetchData(context, widget.adsId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        title: "تفاصيل الاعلان",
      ),
      body: BlocBuilder<GenericCubit<InvestmentAdsModel?>,
          GenericState<InvestmentAdsModel?>>(
        bloc: compProductAdsData.investmentAdsCubit,
        builder: (_, state) {
          if (state is GenericUpdateState) {
            return ListView(
              children: [
                BuildInvTitle(title: "صور الاعلان"),
                Visibility(
                  visible: state.data!.investmentAdsDetails.imgs.isEmpty,
                  child: Center(
                    child: MyText(
                      title: "لا يوجد صور",
                    ),
                  ),
                  replacement: BuildProductImages(
                    images: state.data!.investmentAdsDetails.imgs,
                  ),
                ),
                BuildInvTitle(title: "فيديوهات الاعلان"),
                Visibility(
                  visible: state.data!.investmentAdsDetails.videos.isEmpty,
                  child: Center(
                    child: MyText(
                      title: "لا يوجد فيديوهات",
                    ),
                  ),
                  replacement: BuildAdsVideoList(
                    videos: state.data!.investmentAdsDetails.videos,
                  ),
                ),
                BuildInvTitle(title: "وصف الاعلان"),
                BuildProductDesc(
                  desc: state.data!.investmentAdsDetails.advertDescription,
                ),
                BuildInvTitle(title: " الاسئلة"),
                Visibility(
                  visible: state.data!.questions.isEmpty,
                  child: Center(
                    child: MyText(
                      title: "لا يوجد اسئلة",
                      size: 11,
                      color: MyColors.white,
                    ),
                  ),
                  replacement: BuildProductQuestions(
                    compProductAdsData: compProductAdsData,
                    isShow: state.data!.investmentAdsDetails.isShow,
                  ),
                ),
                BuildInvTitle(title: "صاحب الإعلان"),
                BuildProductOwner(
                  compProductAdsData: compProductAdsData,
                  adsDetailsModel: state.data!.investmentAdsDetails,
                  kayanOwnerModel: state.data!.kayanOwner,
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
    );
  }
}
