part of 'CompStatisticsRateWidgetsImports.dart';

class BuildNavigateTables extends StatelessWidget {
  final int type;
  final CompanyStatisticsRateData companyStatisticsRateData;

  const BuildNavigateTables(
      {required this.type, required this.companyStatisticsRateData});

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case 1:
        return BuildSpecificTable(
          companyStatisticsRateData: companyStatisticsRateData,
          type: type,
        );
      case 2:
        return BuildProductTable(
          companyStatisticsRateData: companyStatisticsRateData,
          type: type,
        );
      case 3:
        return BuildBusinessTable(
          companyStatisticsRateData: companyStatisticsRateData,
          type: type,
        );
      default:
        return BuildMainTable(
          companyStatisticsRateData: companyStatisticsRateData,
          type: type,
        );
    }
  }
}
