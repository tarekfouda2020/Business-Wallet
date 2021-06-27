part of 'CompStatisticsWidgetsImports.dart';

class BuildStatisticsTable extends StatelessWidget {
  final List<CompStatisticsModel> compStatisticsModel;
  final CompanyStatisticsData companyStatisticsData;

  const BuildStatisticsTable(
      {required this.compStatisticsModel, required this.companyStatisticsData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 40),
      child: Table(
        children: List.generate(
          compStatisticsModel.length,
          (index) {
            return TableRow(
              decoration: BoxDecoration(
                border: Border.all(
                  color: MyColors.primary.withOpacity(.3),
                  width: 1,
                ),
              ),
              children: [
                BuildTableItem(
                  title: "${compStatisticsModel[index].name}",
                  companyStatisticsData: companyStatisticsData,
                  compStatisticsModel: compStatisticsModel[index],
                ),
                BuildTableItem(
                  title: "${compStatisticsModel[index].date}",
                  companyStatisticsData: companyStatisticsData,
                  compStatisticsModel: compStatisticsModel[index],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
