part of 'WalletImports.dart';

class Wallet extends StatefulWidget {
  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  final WalletData walletData = new WalletData();

  @override
  void initState() {
    walletData.fetchData(context, refresh: false);
    walletData.fetchData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        title: "المحفظه",
      ),
      body: BlocBuilder<GenericCubit<WalletModel?>, GenericState<WalletModel?>>(
        bloc: walletData.walletCubit,
        builder: (_, state) {
          if (state is GenericUpdateState) {
            return BuildWalletPageView(
              walletData: walletData,
              walletModel: state.data,
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
