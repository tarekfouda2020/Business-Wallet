part of 'CompanyMainDetailsImports.dart';

class CompanyMainDetails extends StatefulWidget {
  final String kayanId;

  const CompanyMainDetails({required this.kayanId});

  @override
  _CompanyMainDetailsState createState() => _CompanyMainDetailsState();
}

class _CompanyMainDetailsState extends State<CompanyMainDetails> {
  final CompanyMainDetailsData companyMainDetailsData =
      new CompanyMainDetailsData();

  @override
  void initState() {
    companyMainDetailsData.fetchData(context, widget.kayanId);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        title: "التفاصيل",
        showLeading: true,
      ),
      body: BlocBuilder<GenericCubit<MainDetailsModel?>,
          GenericState<MainDetailsModel?>>(
        bloc: companyMainDetailsData.mainDetailsCubit,
        builder: (_, state) {
          if (state is GenericUpdateState) {
            return ListView(
              padding: const EdgeInsets.symmetric(vertical: 20),
              children: [
                BuildProductImg(
                  backGroundImg: state.data!.details!.backgroundImg,
                ),
                BuildProductDetails(
                  detailsModel: state.data!.details,
                  companyMainDetailsData: companyMainDetailsData,
                ),
                Visibility(
                  visible: state.data!.details!.showDescriptionKayan,
                  child: BuildShowDescription(
                    companyMainDetailsData: companyMainDetailsData,
                    detailsModel: state.data!.details,
                  ),
                  replacement: Container(),
                ),
                BuildContactDrop(
                  companyMainDetailsData: companyMainDetailsData,
                  detailsModel: state.data!.details,
                ),
                BuildSocialDrop(
                  companyMainDetailsData: companyMainDetailsData,
                  detailsModel: state.data!.details,
                ),
                BuildImgDrop(
                  companyMainDetailsData: companyMainDetailsData,
                  detailsModel: state.data!.details,
                ),
                BuildShowPartner(
                  companyMainDetailsData: companyMainDetailsData,
                  detailsModel: state.data!.details,
                ),
                BuildShowAccreditation(
                  companyMainDetailsData: companyMainDetailsData,
                  detailsModel: state.data!.details,
                ),
                BuildCommentsDrop(
                  companyMainDetailsData: companyMainDetailsData,
                  commentModel: state.data!.comments,
                  kayanId: state.data!.details!.kayanId,
                ),
                BuildRateCompany(
                  companyMainDetailsData: companyMainDetailsData,
                  detailsModel: state.data!.details,
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
      bottomNavigationBar: BuildCommentButton(
        companyMainDetailsData: companyMainDetailsData,
      ),
    );
  }
}
