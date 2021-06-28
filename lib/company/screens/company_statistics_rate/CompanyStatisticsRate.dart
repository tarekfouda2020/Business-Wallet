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
    widget.type == 1
        ? companyStatisticsRateData.getSpecificAdsDetails(context, widget.id)
        : widget.type == 2
            ? companyStatisticsRateData.getProductAdsDetails(context, widget.id)
            : widget.type == 3
                ? companyStatisticsRateData.getBusinessAdsDetails(
                    context, widget.id)
                : companyStatisticsRateData.getMainAdsDetails(
                    context, widget.id);
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
          widget.type == 1
              ? BuildSpecificTable(
                  companyStatisticsRateData: companyStatisticsRateData)
              : widget.type == 2
                  ? BuildProductTable(
                      companyStatisticsRateData: companyStatisticsRateData)
                  : widget.type == 3
                      ? BuildBusinessTable(
                          companyStatisticsRateData: companyStatisticsRateData)
                      : BuildMainTable(
                          companyStatisticsRateData: companyStatisticsRateData),


        ],
      ),
    );
  }
}
