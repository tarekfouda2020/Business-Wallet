part of 'CompanyProfileImport.dart';

class CompanyProfile extends StatefulWidget {
  @override
  _CompanyProfileState createState() => _CompanyProfileState();
}

class _CompanyProfileState extends State<CompanyProfile> {
  final CompanyProfileData companyProfileData = new CompanyProfileData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        title: "الصفحة الشخصية",
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        children: [
          BuildImageView(),
          BuildProfileInfo(),
          BuildDescription(),
          BuildInterestDrop(companyProfileData: companyProfileData),
          BuildContactDrop(companyProfileData: companyProfileData),
          BuildSocialDrop(companyProfileData: companyProfileData),
          BuildImgDrop(companyProfileData: companyProfileData),
          BuildCommentsDrop(companyProfileData: companyProfileData),
        ],
      ),
    );
  }
}
