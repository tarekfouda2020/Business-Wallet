part of 'CompanyMainDetailsImports.dart';

class CompanyMainDetails extends StatefulWidget {
  @override
  _CompanyMainDetailsState createState() => _CompanyMainDetailsState();
}

class _CompanyMainDetailsState extends State<CompanyMainDetails> {
  final CompanyMainDetailsData companyMainDetailsData =
      new CompanyMainDetailsData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        showLeading: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        children: [
          BuildProductImg(),
          BuildProductDetails(),
          BuildContactDrop(companyMainDetailsData: companyMainDetailsData),
          BuildSocialDrop(companyMainDetailsData: companyMainDetailsData),
          BuildImgDrop(companyMainDetailsData: companyMainDetailsData),
          BuildCommentsDrop(companyMainDetailsData: companyMainDetailsData)
        ],
      ),
    );
  }
}
