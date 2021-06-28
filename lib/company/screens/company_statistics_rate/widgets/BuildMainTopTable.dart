part of 'CompStatisticsRateWidgetsImports.dart';
class BuildMainTopTable extends StatelessWidget {

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
                title: "مدة الاعلان",
                size: 12,
                alien: TextAlign.center,
                color: MyColors.primary,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.center,
              child: MyText(
                title: "التكلفة",
                size: 12,
                color: MyColors.primary,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.center,
              child: MyText(
                title: "عدد الزيارات",
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
