part of 'CompanyBarcodeImports.dart';

class CompanyBarcode extends StatefulWidget {
  @override
  _CompanyBarcodeState createState() => _CompanyBarcodeState();
}

class _CompanyBarcodeState extends State<CompanyBarcode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(title: "باركود",),
    );
  }
}
