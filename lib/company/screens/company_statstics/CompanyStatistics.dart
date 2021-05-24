part of 'CompanyStatisticsImports.dart';

class CompanyStatistics extends StatefulWidget {
  @override
  _CompanyStatisticsState createState() => _CompanyStatisticsState();
}

class _CompanyStatisticsState extends State<CompanyStatistics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        title: "احصائيات وتقارير",
      ),
    );
  }
}
