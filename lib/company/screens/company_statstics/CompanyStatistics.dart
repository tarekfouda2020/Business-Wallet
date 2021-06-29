part of 'CompanyStatisticsImports.dart';

class CompanyStatistics extends StatefulWidget {
  @override
  _CompanyStatisticsState createState() => _CompanyStatisticsState();
}

class _CompanyStatisticsState extends State<CompanyStatistics> {
  final CompanyStatisticsData companyStatisticsData =
      new CompanyStatisticsData();

  @override
  void initState() {
    companyStatisticsData.fetchData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        title: "احصائيات وتقارير",
      ),
      body: BlocBuilder<GenericCubit<CompStatisticsDetailsModel?>,
          GenericState<CompStatisticsDetailsModel?>>(
        bloc: companyStatisticsData.statisticsCubit,
        builder: (_, state) {
          if (state is GenericUpdateState) {
            return Column(
              children: [
                BuildStatisticsText(),
                Flexible(
                  child: ListView(
                    children: [
                      Row(
                        children: [
                          BuildStatisticsItem(
                            title: "الزيارات",
                            numb: state.data!.countView.toString(),
                          ),
                          BuildStatisticsItem(
                            title: "مشاركة الصفحة",
                            numb: state.data!.countShare.toString(),
                          ),
                          BuildStatisticsItem(
                            title: "عدد المتابعين",
                            numb: state.data!.countFollow.toString(),
                          ),
                        ],
                      ),
                      BuildStatisticsTable(
                        compStatisticsModel: state.data!.statistics,
                        companyStatisticsData: companyStatisticsData,
                      )
                    ],
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: LoadingDialog.showLoadingView(),
            );
          }
        },
      ),
    );
  }
}
