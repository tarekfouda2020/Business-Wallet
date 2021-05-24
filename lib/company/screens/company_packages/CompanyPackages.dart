part of 'CompanyPackagesImports.dart';

class CompanyPackages extends StatefulWidget {
  @override
  _CompanyPackagesState createState() => _CompanyPackagesState();
}

class _CompanyPackagesState extends State<CompanyPackages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        title: "الباقات الاعلانية",
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Wrap(
          spacing: 10,
          runSpacing: 10,
          runAlignment: WrapAlignment.center,
          alignment: WrapAlignment.start,
          children: List.generate(
            3,
            (index) => BuildPackagesItem(),
          ),
        ),
      ),
    );
  }
}
