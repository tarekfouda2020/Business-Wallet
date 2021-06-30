part of 'FavoriteDetailsImports.dart';

class FavoriteDetails extends StatefulWidget {
  final int adsId;
  final bool checkInvite;

  const FavoriteDetails({required this.adsId, this.checkInvite = true});

  @override
  _FavoriteDetailsState createState() => _FavoriteDetailsState();
}

class _FavoriteDetailsState extends State<FavoriteDetails> {
  final FavoriteDetailsData favoriteDetailsData = new FavoriteDetailsData();

  @override
  void initState() {
    favoriteDetailsData.fetchData(context, widget.adsId,refresh: false);

    favoriteDetailsData.fetchData(context, widget.adsId);
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
        bloc: favoriteDetailsData.investmentAdsCubit,
        builder: (_, state) {
          if (state is GenericUpdateState) {
            return ListView(
              padding: const EdgeInsets.symmetric(vertical: 10),
              children: [
                BuildDescription(
                  desc: state.data!.investmentAdsDetails.advertDescription,
                ),
                BuildInvTitle(title: " الاسئلة"),
                Visibility(visible: state.data!.questions.isEmpty,
                  child: Center(
                    child: MyText(
                      title: "لا يوجد اسئلة",
                      size: 11,
                      color: MyColors.white,
                    ),
                  ),
                  replacement: BuildQuestionList(
                    favoriteDetailsData: favoriteDetailsData,
                    isShow: state.data!.investmentAdsDetails.isShow,
                  ),
                ),
                BuildInvTitle(title: "صاحب الإعلان"),
                BuildAdsOwner(
                  favoriteDetailsData: favoriteDetailsData,
                  adsDetailsModel: state.data!.investmentAdsDetails,
                  kayanOwnerModel: state.data!.kayanOwner,
                ),
                Visibility(
                  visible: state.data!.investmentAdsDetails.isShow == false,
                  child: LoadingButton(
                    btnKey: favoriteDetailsData.btnKey,
                    title: "تأكيد",
                    color: MyColors.primary,
                    textColor: MyColors.blackOpacity,
                    margin: const EdgeInsets.symmetric(vertical: 30),
                    onTap: () => favoriteDetailsData.answerQuestion(
                        context, state.data!.investmentAdsDetails.id),
                  ),
                  replacement: Container(),
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
