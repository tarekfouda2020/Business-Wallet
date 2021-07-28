part of 'CompanyPointsImports.dart';

class CompanyPointsData {
  final GenericCubit<List<WalletDetailsModel>> walletDetailsCubit =
      new GenericCubit([]);

  void fetchData(BuildContext context,{bool refresh=true}) async {
    var data = await CompanyRepository(context).getWalletDetails(refresh);
    walletDetailsCubit.onUpdateData(data);
  }
}
