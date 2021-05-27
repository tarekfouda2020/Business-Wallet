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
      body: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
          child: Wrap(
            spacing: 12,
            runSpacing: 12,
            runAlignment: WrapAlignment.start,
            alignment: WrapAlignment.start,
            children: List.generate(
              5,
                  (index) => BuildPackagesItem(),
            ),
          ),
        ),
      )
    );
  }
}
