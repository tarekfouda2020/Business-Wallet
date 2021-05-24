part of 'WalletWidgetsImports.dart';

class BuildTextSalary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          height: 40,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: MyColors.primary,
              width: 1,
            ),
          ),
          child: MyText(
            title: "300 هلله",
            color: MyColors.primary,
            size: 14,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: MyText(
            title: "الرصيد 3 ريال",
            color: MyColors.greyWhite.withOpacity(0.7),
          ),
        ),
      ],
    );
  }
}
