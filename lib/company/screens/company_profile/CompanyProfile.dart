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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            BuildImageView(),
            BuildProfileInfo(),
            BuildInterestDrop(companyProfileData: companyProfileData),
            BuildContactDrop(companyProfileData: companyProfileData),
            BuildSocialDrop(companyProfileData: companyProfileData),
            BuildImgDrop(companyProfileData: companyProfileData),
            BuildShowAccreditation(
              companyProfileData: companyProfileData,
            ),
            BuildShowPartner(
              companyProfileData: companyProfileData,
            ),
            BuildCommentsDrop(companyProfileData: companyProfileData),
          ],
        ),
      ),
    );
  }
}
