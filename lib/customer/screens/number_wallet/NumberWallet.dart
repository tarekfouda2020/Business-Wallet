part of 'NumberWalletImports.dart';

class NumberWallet extends StatefulWidget {
  @override
  _NumberWalletState createState() => _NumberWalletState();
}

class _NumberWalletState extends State<NumberWallet> {
  final NumberWalletData numberWalletData = new NumberWalletData();

  @override
  void initState() {
    numberWalletData.fetchData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        title: "رقم المحفظه",
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuildNumberWalletText(),
            BuildCode(numberWalletData:numberWalletData),
          ],
        ),
      ),
    );
  }
}
