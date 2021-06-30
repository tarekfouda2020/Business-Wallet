part of 'CompBusinessAdsImports.dart';

class CompBusinessAds extends StatefulWidget {
  final int adsId;

  const CompBusinessAds({required this.adsId});

  @override
  _CompBusinessAdsState createState() => _CompBusinessAdsState();
}

class _CompBusinessAdsState extends State<CompBusinessAds> {
  final CompBusinessAdsData compBusinessAdsData = new CompBusinessAdsData();

  @override
  void initState() {
    compBusinessAdsData.fetchData(context, widget.adsId, refresh: false);
    compBusinessAdsData.fetchData(context, widget.adsId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        title: "تفاصيل الاعلان",
      ),
      body: BlocBuilder<GenericCubit<CompFavDetailsModel?>,
          GenericState<CompFavDetailsModel?>>(
        bloc: compBusinessAdsData.adsDetailsCubit,
        builder: (_, state) {
          if (state is GenericUpdateState) {
            return ListView(
              children: [
                BuildAdsContact(compFavDetailsModel: state.data!),
                BuildAdsDesc(
                  desc: state.data!.details,
                ),
                BuildAdsServices(
                  serviceModel: state.data!.services,
                ),
                BuildAdsProduct(
                  images: state.data!.images,
                ),
                BuildAdsOwner(
                  compFavDetailsModel: state.data!,
                  compBusinessAdsData: compBusinessAdsData,
                  adsId: widget.adsId,
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
