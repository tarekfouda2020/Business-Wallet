part of 'AccountReconciliationImports.dart';

class AccountReconciliationData {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  final GenericCubit<bool> termsCubit = GenericCubit(false);
  final GlobalKey<CustomButtonState> btnKey =
      new GlobalKey<CustomButtonState>();

  final TextEditingController name = new TextEditingController();
  final TextEditingController wallet = new TextEditingController();
  final GlobalKey<DropdownSearchState> bank = new GlobalKey();
  int? bankId;

  void onSelectBank(DropDownModel model) {
    bankId = model.id;
  }

  final GenericCubit<ReconciliationDataModel?> reconciliationCubit =
      new GenericCubit(null);

  void fetchData(BuildContext context, double cost, double costMun) async {
    var data =
        await CustomerRepository(context).getReconciliation(cost, costMun);
    reconciliationCubit.onUpdateData(data);
  }

  void reconciliationBank(
    BuildContext context,
    double cost,
    double point,
  ) async {
    if (formKey.currentState!.validate()) {
      if (!termsCubit.state.data) {
        LoadingDialog.showSimpleToast("هل وافقت علي الشروط ");
        return;
      }
      btnKey.currentState!.animateForward();

      await CustomerRepository(context).reconciliationBank(
          cost, point, name.text, bankId.toString(), wallet.text);
      btnKey.currentState!.animateReverse();
    }
  }
}
