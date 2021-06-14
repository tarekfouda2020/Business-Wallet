part of 'WalletHelpImports.dart';
class WalletHelpData{
  final GenericCubit<String?> helpCubit = new GenericCubit(null);

  void fetchData(BuildContext context) async {
    var data = await CustomerRepository(context).walletHelp();
    helpCubit.onUpdateData(data);
  }
}