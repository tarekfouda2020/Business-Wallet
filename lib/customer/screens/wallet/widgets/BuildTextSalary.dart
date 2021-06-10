part of 'WalletWidgetsImports.dart';

class BuildTextSalary extends StatelessWidget {
  final WalletModel? walletModel;

  const BuildTextSalary({required this.walletModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          height: 60,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: MyColors.primary,
              width: 1,
            ),
          ),
          child: MyText(
            title: "${walletModel!.cost} هلله",
            color: MyColors.primary,
            size: 14,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: MyText(
            title: "الرصيد ${walletModel!.costMun} ريال",
            color: MyColors.greyWhite.withOpacity(0.9),
          ),
        ),
      ],
    );
  }
}
