part of 'CompanyBrochureImports.dart';

class CompanyBrochure extends StatefulWidget {
  @override
  _CompanyBrochureState createState() => _CompanyBrochureState();
}

class _CompanyBrochureState extends State<CompanyBrochure> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        title: "بيانات البروشور",
      ),
    );
  }
}
