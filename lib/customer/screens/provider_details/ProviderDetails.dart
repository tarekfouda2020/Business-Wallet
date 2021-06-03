part of 'ProviderDetailsImports.dart';

class ProviderDetails extends StatefulWidget {
  final String kayanId;

  ProviderDetails({required this.kayanId});

  @override
  _ProviderDetailsState createState() => _ProviderDetailsState();
}

class _ProviderDetailsState extends State<ProviderDetails> {
  final ProviderDetailsData providerDetailsData = ProviderDetailsData();

  @override
  void initState() {
    providerDetailsData.fetchData(context, widget.kayanId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        title: "",
        leading: IconButton(
          icon: Icon(
            Icons.share,
            color: MyColors.white,
          ),
          onPressed: () {},
        ),
      ),
      body: BlocBuilder<GenericCubit<MainDetailsModel?>,
          GenericState<MainDetailsModel?>>(
        bloc: providerDetailsData.mainDetailsCubit,
        builder: (_, state) {
          if (state is GenericUpdateState) {
            return ListView(
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              children: [
                BuildPicture(backGroundImg: state.data!.details!.backgroundImg),
                BuildInformations(detailsModel: state.data!.details),
                BuildProviderDescription(
                  providerDetailsData: providerDetailsData,
                  detailsModel: state.data!.details,
                ),
                BuildContactInfo(
                  providerDetailsData: providerDetailsData,
                  detailsModel: state.data!.details,
                ),
                BuildSocialInfo(
                  providerDetailsData: providerDetailsData,
                  detailsModel: state.data!.details,
                ),
                BuildPhotosInfo(
                  providerDetailsData: providerDetailsData,
                  products: state.data!.details!.products,
                ),
                BuildCommentsInfo(
                  providerDetailsData: providerDetailsData,
                  commentModel: state.data!.comments,
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
      bottomNavigationBar: BuildCommentField(
        providerDetailsData: providerDetailsData,
      ),
    );
  }
}
