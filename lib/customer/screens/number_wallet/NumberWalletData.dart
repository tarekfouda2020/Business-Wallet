part of 'NumberWalletImports.dart';

class NumberWalletData {
  final GenericCubit<String?> promoCode = new GenericCubit("");

  void fetchData(BuildContext context,{bool refresh=true}) async {
    var data = await CustomerRepository(context).promoCode(refresh);
    promoCode.onUpdateData(data);
  }
}
