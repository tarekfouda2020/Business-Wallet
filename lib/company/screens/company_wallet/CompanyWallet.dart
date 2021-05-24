part of 'CompanyWalletImports.dart';

class CompanyWallet extends StatefulWidget {
  @override
  _CompanyWalletState createState() => _CompanyWalletState();
}

class _CompanyWalletState extends State<CompanyWallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        title: "المحفظة",
      ),
    );
  }
}
