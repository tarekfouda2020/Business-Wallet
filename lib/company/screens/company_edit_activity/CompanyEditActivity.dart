part of 'CompanyEditActivityImports.dart';

class CompanyEditActivity extends StatefulWidget {
  @override
  _CompanyEditActivityState createState() => _CompanyEditActivityState();
}

class _CompanyEditActivityState extends State<CompanyEditActivity> {
  final CompanyEditActivityData companyEditActivityData =
      new CompanyEditActivityData();

  @override
  void initState() {
    companyEditActivityData.seInitialData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        title: "النشاط",
      ),
      body: Column(
        children: [
          BuildText(),
          Flexible(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 10),
              children: [
                BuildPrimaryBranch(
                    companyEditActivityData: companyEditActivityData),
                BuildSecondaryBranch(
                    companyEditActivityData: companyEditActivityData)
              ],
            ),
          ),
          LoadingButton(
            btnKey: companyEditActivityData.btnKey,
            title: "تأكيد",
            onTap: () => companyEditActivityData.saveImportantData(context),
            color: MyColors.primary,
            textColor: MyColors.black,
            borderRadius: 30,
            margin: const EdgeInsets.all(20),
          )
        ],
      ),
    );
  }
}
