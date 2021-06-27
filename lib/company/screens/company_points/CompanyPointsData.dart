part of 'CompanyPointsImports.dart';

class CompanyPointsData {
  final GenericCubit<List<WalletDetailsModel>> walletDetailsCubit =
      new GenericCubit([]);

  void fetchData(BuildContext context) async {
    var data = await CompanyRepository(context).getWalletDetails();
    walletDetailsCubit.onUpdateData(data);
  }
}
