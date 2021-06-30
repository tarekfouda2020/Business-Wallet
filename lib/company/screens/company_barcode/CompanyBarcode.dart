part of 'CompanyBarcodeImports.dart';

class CompanyBarcode extends StatefulWidget {
  @override
  _CompanyBarcodeState createState() => _CompanyBarcodeState();
}

class _CompanyBarcodeState extends State<CompanyBarcode> {
  final CompanyBarcodeData companyBarcodeData = new CompanyBarcodeData();

  @override
  void initState() {    companyBarcodeData.fetchData(context,refresh:false);

  companyBarcodeData.fetchData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        title: "باركود",
      ),
      body: BuildBarCode(
        companyBarcodeData: companyBarcodeData,
      ),
    );
  }
}
