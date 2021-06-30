part of 'CompanyWalletNumbImports.dart';

class CompanyWalletNumbData {
  final GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();
  final GenericCubit<String?> promoCode = new GenericCubit("");

  void fetchData(BuildContext context,{bool refresh=true}) async {
    var data = await CompanyRepository(context).promoCode(refresh);
    promoCode.onUpdateData(data);
  }
}
