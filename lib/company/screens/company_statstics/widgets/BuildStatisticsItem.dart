part of 'CompStatisticsWidgetsImports.dart';

class BuildStatisticsItem extends StatelessWidget {
  final String title;
  final String numb;

  BuildStatisticsItem({required this.title, required this.numb});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 130,
                child: Card(
                  color: MyColors.black,
                  shape: PolygonBorder(
                    sides: 6,
                    borderRadius: 5.0,
                    rotate: 90.0,
                    border: BorderSide(
                        color: MyColors.greyWhite,
                        width: 5), // Default BorderSide.none
                  ),
                  elevation: 0,
                ),
              ),
              MyText(
                title: numb,
                size: 16,
                color: MyColors.primary,
              ),
            ],
          ),
          MyText(
            title: title,
            size: 11,
            color: MyColors.grey,
            alien: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
