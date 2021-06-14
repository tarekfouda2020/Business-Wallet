part of 'ReconciliationWidgetsImports.dart';

class BuildPrice extends StatelessWidget {
  final double costMun;

  const BuildPrice({required this.costMun});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MyText(
            title: "رصيد المحفظة",
            size: 16,
            color: MyColors.grey,
          ),
          Container(
            alignment: Alignment.center,
            height: 60,
            width: 150,
            margin: const EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: MyColors.primary,
                width: 1,
              ),
            ),
            child: MyText(
              title: costMun.toString(),
              color: MyColors.primary,
              size: 14,
            ),
          ),
          MyText(
            title: "  ريال سعودي",
            color: MyColors.greyWhite.withOpacity(0.9),
          ),
        ],
      ),
    );
  }
}
