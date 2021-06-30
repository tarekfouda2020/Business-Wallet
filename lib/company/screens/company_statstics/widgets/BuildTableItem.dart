part of 'CompStatisticsWidgetsImports.dart';

class BuildTableItem extends StatelessWidget {
  final String title;
  final CompStatisticsModel compStatisticsModel;
  final CompanyStatisticsData companyStatisticsData;


  const BuildTableItem(
      {required this.title,
      required this.compStatisticsModel,
      required this.companyStatisticsData});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: compStatisticsModel.type == 4,
      child: PopupMenuButton(
        color: Colors.white,
        elevation: 20,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: MyColors.primary.withOpacity(.3),
                width: 1,
              ),
            ),
          ),
          child: MyText(
            title: title,
            alien: TextAlign.center,
            size: 11,
            color: MyColors.white,
          ),
        ),
        enabled: true,
        onSelected: (int value) => companyStatisticsData.navigate(
          context,
          value,
          compStatisticsModel.type,
          compStatisticsModel.id,
        ),
        itemBuilder: (context) => [
          PopupMenuItem(
            child: MyText(
              title: "التفاصيل",
              color: MyColors.black,
            ),
            value: 0,
          ),
        ],
      ),
      replacement: PopupMenuButton(
        color: Colors.white,
        elevation: 20,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: MyColors.primary.withOpacity(.3),
                width: 1,
              ),
            ),
          ),
          child: MyText(
            title: title,
            alien: TextAlign.center,
            size: 11,
            color: MyColors.white,
          ),
        ),
        enabled: true,
        onSelected: (int value) => companyStatisticsData.navigate(
          context,
          value,
          compStatisticsModel.type,
          compStatisticsModel.id,
        ),
        itemBuilder: (context) => [
          PopupMenuItem(
            child: MyText(
              title: "التفاصيل",
              color: MyColors.black,
            ),
            value: 0,
          ),
          PopupMenuItem(
            child: MyText(
              title: "معاينة",
              color: MyColors.black,
            ),
            value: 1,
          ),
        ],
      ),
    );
  }
}
