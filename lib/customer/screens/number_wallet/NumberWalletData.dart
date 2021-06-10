part of 'NumberWalletImports.dart';

class NumberWalletData {
  final GenericCubit<String?> promoCode = new GenericCubit("");

  void fetchData(BuildContext context) async {
    var data = await CustomerRepository(context).promoCode();
    promoCode.onUpdateData(data);
  }
}
