part of 'WalletHelpImports.dart';

class WalletHelp extends StatefulWidget {
  @override
  _WalletHelpState createState() => _WalletHelpState();
}

class _WalletHelpState extends State<WalletHelp> {
  final WalletHelpData walletHelpData = new WalletHelpData();

  @override
  void initState() {
    walletHelpData.fetchData(context, refresh: false);
    walletHelpData.fetchData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        title: "المحفظة",
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        children: [
          Center(
            child: MyText(
              title: "صفحه محفظه الكيان",
              size: 18,
              color: MyColors.primary,
            ),
          ),
          HeaderLogo(),
          BlocBuilder<GenericCubit<String?>, GenericState<String?>>(
            bloc: walletHelpData.helpCubit,
            builder: (_, state) {
              if (state is GenericUpdateState) {
                return MyText(
                  title: state.data!,
                );
              } else {
                return Center(
                  child: LoadingDialog.showLoadingView(),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
