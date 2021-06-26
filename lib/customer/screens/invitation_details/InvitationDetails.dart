part of 'InvitationDetailsImports.dart';

class InvitationDetails extends StatefulWidget {
  final int adsId;
  final bool checkInvite;

  const InvitationDetails({required this.adsId, this.checkInvite = true});

  @override
  _InvitationDetailsState createState() => _InvitationDetailsState();
}

class _InvitationDetailsState extends State<InvitationDetails>
    with SingleTickerProviderStateMixin {
  final InvitationDetailsData invitationDetailsData = InvitationDetailsData();

  @override
  void initState() {
    invitationDetailsData.fetchData(context, widget.adsId);
    invitationDetailsData.initAnimation(this,context, widget.adsId,widget.checkInvite,refreshPage);

    super.initState();
  }

  refreshPage(){
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      body: BlocBuilder<GenericCubit<SpecificAdsModel?>,
          GenericState<SpecificAdsModel?>>(
        bloc: invitationDetailsData.specificAdsCubit,
        builder: (_, state) {
          if (state is GenericUpdateState) {
            return Column(
              children: [
                Container(
                  height: 180,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      BuildInvAppBar(),
                      BuildInvAnimation(
                        invitationDetailsData: invitationDetailsData,
                        adsDetailsModel: state.data!.previewAds,
                      ),
                      BuildAnimationDetails(
                        invitationDetailsData: invitationDetailsData,
                        adsDetailsModel: state.data!.previewAds,
                      )
                    ],
                  ),
                ),
                Flexible(
                  child: ListView(
                    padding: const EdgeInsets.only(top: 10),
                    physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics(),
                    ),
                    children: [
                      BuildInvInfo(
                        adsDetailsModel: state.data!.previewAds,
                        invitationDetailsData: invitationDetailsData,
                        kayanOwnerModel: state.data!.kayanOwner,
                      ),
                      BuildInvTitle(title: "وصف الاعلان"),
                      BuildInvDescription(
                        desc: state.data!.previewAds.advertDescription,
                      ),
                      BuildInvTitle(title: "الصور"),
                      Visibility(
                        visible: state.data!.previewAds.images.isEmpty,
                        child: Center(
                          child: MyText(
                            title: "لا يوجد صور",
                          ),
                        ),
                        replacement: BuildInvSwiper(
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
                        replacement: BuildVideoList(videos: state.data!.previewAds.videos,),
                      ),
                      BuildInvTitle(title: "صاحب الإعلان"),
                      BuildAdOwner(
                        kayanOwnerModel: state.data!.kayanOwner,
                        adsDetailsModel: state.data!.previewAds,
                        invitationDetailsData: invitationDetailsData,
                      ),
                      BuildInvComments(
                        invitationDetailsData: invitationDetailsData,
                        commentModel: state.data!.previewAds.comments,
                      ),
                      BuildRateApp(
                        invitationDetailsData: invitationDetailsData,
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
      bottomNavigationBar: BuildAddComment(
        invitationDetailsData: invitationDetailsData,
      ),
    );
  }

  @override
  void dispose() {
    invitationDetailsData.controller.dispose();
    super.dispose();
  }
}
