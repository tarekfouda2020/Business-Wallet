part of 'DetailsImports.dart';

class DetailsData {
  final GenericCubit<List<WalletDetailsModel>> walletDetailsCubit =
      new GenericCubit([]);

  void fetchData(BuildContext context) async {
    var data = await CustomerRepository(context).getWalletDetails();
    walletDetailsCubit.onUpdateData(data);
  }
}
