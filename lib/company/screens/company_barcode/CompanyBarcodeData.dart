part of 'CompanyBarcodeImports.dart';

class CompanyBarcodeData {
  final GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();
  final GenericCubit<BarcodeModel?> barcodeCubit = new GenericCubit(null);

  void fetchData(BuildContext context,{bool refresh=true}) async {
    var data = await CompanyRepository(context).getBarcode(refresh);
    barcodeCubit.onUpdateData(data);
  }
}
