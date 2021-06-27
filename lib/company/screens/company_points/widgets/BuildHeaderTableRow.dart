part of 'CompanyPointsWidgetsImports.dart';

class BuildHeaderTableRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.center,
              child: MyText(
                title: "اسم الكيان",
                size: 12,
                alien: TextAlign.center,
                color: MyColors.primary,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.center,
              child: MyText(
                title: "الحالة",
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
