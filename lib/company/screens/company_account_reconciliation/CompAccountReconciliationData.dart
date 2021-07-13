part of 'CompAccountReconciliationImports.dart';

class CompAccountReconciliationData {
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

  final GenericCubit<CompFilterReconciliationModel?> reconciliationCubit =
      new GenericCubit(null);

  void fetchData(BuildContext context) async {
    var data = await CompanyRepository(context).getReconciliation();
    reconciliationCubit.onUpdateData(data);
  }

  void reconciliationBank(
      BuildContext context, double cost, double point) async {
    if (formKey.currentState!.validate()) {
      if (!termsCubit.state.data) {
        LoadingDialog.showSimpleToast("هل وافقت علي الشروط ");
        return;
      }
      btnKey.currentState!.animateForward();

      final bool finished = await CompanyRepository(context).reconciliationBank(
          cost, point, name.text, bankId.toString(), wallet.text);
      btnKey.currentState!.animateReverse();
      if (finished) {
        AutoRouter.of(context).pushAndPopUntil(CompanyHomeRoute(index: 3),
            predicate: (predicate) => false);
      }
    }
  }
}
