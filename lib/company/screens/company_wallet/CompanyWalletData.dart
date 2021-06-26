part of 'CompanyWalletImports.dart';

class CompanyWalletData {
  final GenericCubit<String> brochureCubit = new GenericCubit("1");
  final TextEditingController brochure = new TextEditingController();

  final GlobalKey<FormState> formKey = new GlobalKey();
  final GlobalKey<CustomButtonState> btnKey = new GlobalKey();

  final GenericCubit<bool> checkCubit = new GenericCubit(false);

  final GenericCubit<CompWalletModel?> walletCubit = new GenericCubit(null);

  void selectType(String id, BuildContext context) {
    brochureCubit.onUpdateData(id);
    Navigator.of(context).pop();
  }

  void fetchData(BuildContext context) async {
    var data = await CompanyRepository(context).getWalletData();
    walletCubit.onUpdateData(data);
  }

  void shareWalletPoint(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      await CompanyRepository(context)
          .shareWalletPoint(
              brochureCubit.state.data,
              walletCubit.state.data!.balance +
                  (brochureCubit.state.data == "1"
                      ? walletCubit.state.data!.pointsEarned
                      : brochureCubit.state.data == "2"
                          ? walletCubit.state.data!.points
                          : walletCubit.state.data!.pointMonth))
          .then((value) {
        fetchData(context);
      });
    }
  }

  void navigate(BuildContext context) {
    if (walletCubit.state.data!.cost < 30000) {
      LoadingDialog.showCustomToast(
        "الحد الادنى لتصفية المحفظة 300 ريال و التصفية عليها رسوم ادارية 10 ريال",
      );
    } else {
      AutoRouter.of(context).push(CompAccountReconciliationRoute(
          cost: walletCubit.state.data!.cost.toDouble(),
          costMun: walletCubit.state.data!.cost.toDouble()));
    }
  }
}
