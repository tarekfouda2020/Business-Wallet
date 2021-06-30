part of 'WalletHelpImports.dart';
class WalletHelpData{
  final GenericCubit<String?> helpCubit = new GenericCubit(null);

  void fetchData(BuildContext context,{bool refresh=true}) async {
    var data = await CustomerRepository(context).walletHelp(refresh);
    helpCubit.onUpdateData(data);
  }
}