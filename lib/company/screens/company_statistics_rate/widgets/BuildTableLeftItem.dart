part of 'CompStatisticsRateWidgetsImports.dart';

class BuildTableLeftItem extends StatelessWidget {
  final String title;
  final String? desc;

  const BuildTableLeftItem({required this.title,this.desc}) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 17),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            color: MyColors.primary.withOpacity(.3),
            width: 1,
          ),
        ),
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyText(
            title: title,
            size: 11,
            color: MyColors.white,
          ),
          MyText(
            title: desc??"",
            size: 11,
            color: MyColors.white,
          ),
        ],
      ),
    );
  }
}
