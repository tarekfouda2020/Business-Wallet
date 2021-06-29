part of 'CompStatisticsRateWidgetsImports.dart';

class BuildRateTopTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Table(
      children: [
        TableRow(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.center,
              child: MyText(
                title: "الاخصائيات",
                size: 12,
                alien: TextAlign.center,
                color: MyColors.primary,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.center,
              child: MyText(
                title: "المعيار",
                size: 12,
                color: MyColors.primary,
              ),
            ),
          ],
          decoration: BoxDecoration(
            color: MyColors.black,
          ),
        ),
      ],
    );
  }
}
