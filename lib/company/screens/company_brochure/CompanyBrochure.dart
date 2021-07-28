part of 'CompanyBrochureImports.dart';

class CompanyBrochure extends StatefulWidget {
  @override
  _CompanyBrochureState createState() => _CompanyBrochureState();
}

class _CompanyBrochureState extends State<CompanyBrochure> {
  final CompanyBrochureData companyBrochureData = new CompanyBrochureData();

  @override
  void initState() {
    companyBrochureData.fetchBrochureData(context, refresh: false);
    companyBrochureData.fetchBrochureData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        title: "بيانات البروشور",
      ),
      body: BlocBuilder<GenericCubit<BrochureDetailsModel?>,
          GenericState<BrochureDetailsModel?>>(
        bloc: companyBrochureData.brochureDataCubit,
        builder: (_, state) {
          if (state is GenericUpdateState) {
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              children: [
                BuildUserInfo(),
                BuildBrochureForm(companyBrochureData: companyBrochureData),
                LoadingButton(
                  btnKey: companyBrochureData.btnKey,
                  title: "حفظ",
                  onTap: () => companyBrochureData.sendBrochureData(context),
                  borderRadius: 30,
                  color: MyColors.primary,
                  textColor: MyColors.blackOpacity,
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
    );
  }
}
