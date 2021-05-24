part of'NumberWalletImports.dart';
class NumberWallet extends StatefulWidget {
  @override
  _NumberWalletState createState() => _NumberWalletState();
}

class _NumberWalletState extends State<NumberWallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        title: "رقم المحفظه",
      ),
      body: BuildNumberWalletView(),
    );
  }
}
