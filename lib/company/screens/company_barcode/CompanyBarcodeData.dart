part of 'CompanyBarcodeImports.dart';

class CompanyBarcodeData {
  final GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();
  final GenericCubit<BarcodeModel?> barcodeCubit = new GenericCubit(null);

  void fetchData(BuildContext context) async {
    var data = await CompanyRepository(context).getBarcode();
    barcodeCubit.onUpdateData(data);
  }
}
