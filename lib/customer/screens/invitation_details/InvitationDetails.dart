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
    //   invitationDetailsData.fetchData(context, widget.adsId);
    //   invitationDetailsData.initAnimation(this,context, widget.adsId,widget.checkInvite,refreshPage);
    //
    //   super.initState();
    // }
    invitationDetailsData.fetchData(context, widget.adsId, refresh: false);

    invitationDetailsData.fetchData(context, widget.adsId);
    super.initState();
    invitationDetailsData.controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 5000,
      ),
    );

    invitationDetailsData.animation = Tween<double>(
      begin: 0,
      end: 40,
    ).animate(CurvedAnimation(
        parent: invitationDetailsData.controller, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            invitationDetailsData.expandCubit.onUpdateData(220);
            widget.checkInvite
                ? Future.delayed(Duration(milliseconds: 500), () {
                    print("_______${widget.adsId}");

                    invitationDetailsData.updateSpecificAds(
                        context, widget.adsId);
                    invitationDetailsData.getSpecificAdsPoint(
                        context, widget.adsId);
                    invitationDetailsData.showExpandCubit.onUpdateData(true);
                  })
                : Future.delayed(
                    Duration(milliseconds: 500),
                    () {
                      invitationDetailsData.showExpandCubit.onUpdateData(true);
                    },
                  );
          }
        },
      );
    invitationDetailsData.controller.forward();
  }

  refreshPage() {
    setState(() {});
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
                      Visibility(
                        visible: widget.checkInvite,
                        child: BuildInvAnimation(
                          invitationDetailsData: invitationDetailsData,
                          adsDetailsModel: state.data?.previewAds,
                        ),
                      ),
                      BuildAnimationDetails(
                        checkInvite: widget.checkInvite,
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
                      BuildInvSwiper(
                        images: state.data!.previewAds.images,
                        adsDetailsModel: state.data!.previewAds,
                      ),
                      BuildInvTitle(title: "الفيديوهات"),
                      Visibility(
                        visible: state.data!.previewAds.videos.isEmpty,
                        child: Center(
                          child: MyText(
                            title: "لا يوجد فيديوهات",
                          ),
                        ),
                        replacement: BuildVideoList(
                          videos: state.data!.previewAds.videos,
                        ),
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
                      ),
                      BuildAddComment(
                        invitationDetailsData: invitationDetailsData,
                      ),
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
      // bottomNavigationBar: BuildAddComment(
      //   invitationDetailsData: invitationDetailsData,
      // ),
    );
  }

  @override
  void dispose() {
    invitationDetailsData.controller.dispose();
    super.dispose();
  }
}
