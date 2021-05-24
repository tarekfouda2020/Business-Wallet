part of'WalletImports.dart';
class Wallet extends StatefulWidget {
  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  final WalletData walletData = new WalletData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        title: "المحفظه",
      ),
      body: BuildWalletPageView(walletData: walletData,),
    );
  }
}
