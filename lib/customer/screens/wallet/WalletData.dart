part of 'WalletImports.dart';

class WalletData {
  final GlobalKey<FormState> formKey = new GlobalKey();
  final GlobalKey<CustomButtonState> btnKey = new GlobalKey();
  final TextEditingController wallet = new TextEditingController();

  final GenericCubit<bool> checkCubit = new GenericCubit(false);

  final GenericCubit<WalletModel?> walletCubit = new GenericCubit(null);

  void fetchData(BuildContext context,{bool refresh=true}) async {
    var data = await CustomerRepository(context).getWalletData(refresh);
    walletCubit.onUpdateData(data);
  }

  void shareWalletPoint(BuildContext context, int costMoney, int point) async {
    if (formKey.currentState!.validate()) {
      if (!checkCubit.state.data) {
        LoadingDialog.showSimpleToast("من فضلك قم بالموافقه علي عملية التحويل");
        return;
      }
      btnKey.currentState!.animateForward();
      await CustomerRepository(context)
          .shareWalletPoint(costMoney, point, wallet.text)
          .then((value) {
        wallet.clear();
        checkCubit.onUpdateData(false);
        fetchData(context);
      });
      btnKey.currentState!.animateReverse();
    }
  }
}
