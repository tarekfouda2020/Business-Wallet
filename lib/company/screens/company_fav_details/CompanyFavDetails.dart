part of 'CompanyFavDetailsImports.dart';

class CompanyFavDetails extends StatefulWidget {
  final int adsId;
  final int sendCard;
  final int showSendCard;
  final bool checkInvite;

  const CompanyFavDetails(
      {required this.adsId,
      required this.sendCard,
      required this.showSendCard,
      this.checkInvite = true});

  @override
  _CompanyFavDetailsState createState() => _CompanyFavDetailsState();
}

class _CompanyFavDetailsState extends State<CompanyFavDetails>
    with SingleTickerProviderStateMixin {
  final CompanyFavDetailsData companyFavDetailsData =
      new CompanyFavDetailsData();

  @override
  void initState() {
    companyFavDetailsData.fetchData(
        context, widget.adsId, widget.sendCard, widget.showSendCard);
    super.initState();
    companyFavDetailsData.controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 5000,
      ),
    );

    companyFavDetailsData.animation = Tween<double>(
      begin: 0,
      end: 40,
    ).animate(CurvedAnimation(
        parent: companyFavDetailsData.controller, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            companyFavDetailsData.expandCubit.onUpdateData(220);
            widget.checkInvite
                ? Future.delayed(Duration(milliseconds: 500), () {
                    print("_______${widget.adsId}");

                    companyFavDetailsData.updateAds(context, widget.adsId,
                        widget.sendCard, widget.showSendCard);

                    companyFavDetailsData.showExpandCubit.onUpdateData(true);
                  })
                : Future.delayed(
                    Duration(milliseconds: 500),
                    () {
                      companyFavDetailsData.showExpandCubit.onUpdateData(true);
                    },
                  );
          }
        },
      );
    companyFavDetailsData.controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      body: BlocBuilder<GenericCubit<CompFavDetailsModel?>,
          GenericState<CompFavDetailsModel?>>(
        bloc: companyFavDetailsData.adsDetailsCubit,
        builder: (_, state) {
          if (state is GenericUpdateState) {
            return Column(
              children: [
                Container(
                  height: 180,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      BuildAdsAppBar(),
                      BuildInvAnimation(
                        companyFavDetailsData: companyFavDetailsData,
                        compFavDetailsModel: state.data!,
                      ),
                      BuildAnimationDetails(
                        companyFavDetailsData: companyFavDetailsData,
                        compFavDetailsModel: state.data!,
                      )
                    ],
                  ),
                ),
                Flexible(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    children: [
                      BuildContact(compFavDetailsModel: state.data!),
                      BuildDesc(
                        desc: state.data!.details,
                      ),
                      BuildServices(
                        serviceModel: state.data!.services,
                      ),
                      BuildProducts(
                        images: state.data!.images,
                      ),
                      BuildAdsOwner(
                        compFavDetailsModel: state.data!,
                        companyFavDetailsData: companyFavDetailsData,
                        adsId: widget.adsId,
                        sendCard: widget.sendCard,
                        showSendCard: widget.showSendCard,
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
    );
  }
}
