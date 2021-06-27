part of 'CompanyWalletNumbImports.dart';

class CompanyWalletNumbData {
  final GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();
  final GenericCubit<String?> promoCode = new GenericCubit("");

  void fetchData(BuildContext context) async {
    var data = await CompanyRepository(context).promoCode();
    promoCode.onUpdateData(data);
  }
}
