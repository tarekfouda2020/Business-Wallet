part of 'WalletWidgetsImports.dart';

class BuildWalletButton extends StatelessWidget {
  final WalletData walletData;
  final WalletModel? walletModel;

  const BuildWalletButton(
      {required this.walletData, required this.walletModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LoadingButton(
          btnKey: walletData.btnKey,
          title: "تأكيد",
          onTap: () => walletData.shareWalletPoint(
              context, walletModel!.costMun.toInt(), walletModel!.points),
          color: MyColors.primary,
          textColor: MyColors.black,
          borderRadius: 25,
          margin: const EdgeInsets.symmetric(horizontal: 100),
        ),
        BuildCheckTerms(
          walletData: walletData,
        ),
        Divider(
          thickness: 2,
        ),
        DefaultButton(
          title: "تصفيه المحفظه",
          onTap: () {
            print("_____${walletModel!.cost}");
            print("_____@@@${walletModel!.costMun}");

            AutoRouter.of(context).push(AccountReconciliationRoute(
                cost: walletModel!.cost.toDouble(),
                costMun: walletModel!.costMun));
          },

          // onTap: () => navigate(context),
          color: MyColors.primary,
          textColor: MyColors.black,
        ),
      ],
    );
  }

  void navigate(BuildContext context) {
    if (walletModel!.cost < 30000) {
      LoadingDialog.showCustomToast(
        "الحد الادنى لتصفية المحفظة 300 ريال و التصفية عليها رسوم ادارية 10 ريال",
      );
    } else {
      AutoRouter.of(context).push(AccountReconciliationRoute(
          cost: walletModel!.cost.toDouble(), costMun: walletModel!.costMun));
    }
  }
}
