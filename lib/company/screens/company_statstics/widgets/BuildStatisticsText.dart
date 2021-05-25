part of 'CompStatisticsWidgetsImports.dart';

class BuildStatisticsText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: const EdgeInsets.only(bottom: 20),
      color: MyColors.black,
      child: MyText(
        title: "احصائيات وتقارير",
        color: MyColors.greyWhite.withOpacity(.9),
        size: 12,
      ),
    );
  }
}
