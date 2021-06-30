part of 'CompanyStatisticsRateImports.dart';

class CompanyStatisticsRate extends StatefulWidget {
  final int type;
  final int id;

  const CompanyStatisticsRate({required this.type, required this.id});

  @override
  _CompanyStatisticsRateState createState() => _CompanyStatisticsRateState();
}

class _CompanyStatisticsRateState extends State<CompanyStatisticsRate> {
  final CompanyStatisticsRateData companyStatisticsRateData =
      new CompanyStatisticsRateData();

  @override
  void initState() {
    companyStatisticsRateData.initMethods(context, widget.type, widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        title: "تفاصيل النقاط",
      ),
      body: Column(
        children: [
          Visibility(
            visible: widget.type == 4,
            child: BuildMainTopTable(),
            replacement: BuildRateTopTable(),
          ),
          BuildNavigateTables(
            type: widget.type,
            companyStatisticsRateData: companyStatisticsRateData,
          )
        ],
      ),
    );
  }
}
