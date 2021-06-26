part of 'CompWalletWidgetsImports.dart';

class BuildPrice extends StatelessWidget {
  final CompWalletModel compWalletModel;

  const BuildPrice({required this.compWalletModel}) ;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * .4,
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          margin: const EdgeInsets.symmetric(vertical: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: MyColors.primary,
              width: 1,
            ),
          ),
          child: MyText(
            title: "${compWalletModel.cost}هلله",
            color: MyColors.primary,
            size: 14,
          ),
        ),
        MyText(
          title: "الرصيد ${compWalletModel.cost} ريال",
          size: 12,
          color: MyColors.greyWhite.withOpacity(0.9),
        ),
      ],
    );
  }
}
