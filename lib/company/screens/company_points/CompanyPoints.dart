part of 'CompanyPointsImports.dart';

class CompanyPoints extends StatefulWidget {
  @override
  _CompanyPointsState createState() => _CompanyPointsState();
}

class _CompanyPointsState extends State<CompanyPoints> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(title: "تفاصيل النقاط",),
    );
  }
}
