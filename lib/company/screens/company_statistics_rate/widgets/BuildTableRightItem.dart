part of 'CompStatisticsRateWidgetsImports.dart';

class BuildTableRightItem extends StatelessWidget {
  final String title;

  const BuildTableRightItem({required this.title}) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 17),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: MyColors.primary.withOpacity(.3),
            width: 1,
          ),
        ),
      ),
      alignment: Alignment.center,
      child: MyText(
        title: title,
        size: 11,
        overflow: TextOverflow.ellipsis,
        color: MyColors.white,
      ),
    );
  }
}
