part of 'DetailsImports.dart';

class DetailsData {
  final GenericCubit<List<WalletDetailsModel>> walletDetailsCubit =
      new GenericCubit([]);

  void fetchData(BuildContext context,{bool refresh=true}) async {
    var data = await CustomerRepository(context).getWalletDetails(refresh);
    walletDetailsCubit.onUpdateData(data);
  }
}
