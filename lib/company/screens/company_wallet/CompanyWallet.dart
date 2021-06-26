part of 'CompanyWalletImports.dart';

class CompanyWallet extends StatefulWidget {
  @override
  _CompanyWalletState createState() => _CompanyWalletState();
}

class _CompanyWalletState extends State<CompanyWallet> {
  final CompanyWalletData companyWalletData = new CompanyWalletData();

  @override
  void initState() {
    companyWalletData.fetchData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        title: "المحفظة",
      ),
      body: BlocBuilder<GenericCubit<CompWalletModel?>,
          GenericState<CompWalletModel?>>(
        bloc: companyWalletData.walletCubit,
        builder: (_, state) {
          if (state is GenericUpdateState) {
            return ListView(
              children: [
                BuildHelp(),
                BuildWalletText(),
                BuildWalletDetails(compWalletModel: state.data!),
                BuildPrice(compWalletModel: state.data!),
                BuildPriceForm(
                  companyWalletData: companyWalletData,
                  compWalletModel: state.data!,
                ),
                DefaultButton(
                  title: "تصفية المحفظة",
                  onTap: ()=>companyWalletData.navigate(context),
                  color: MyColors.primary,
                  borderRadius: BorderRadius.circular(30),
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
