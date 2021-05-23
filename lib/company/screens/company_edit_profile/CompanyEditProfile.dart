part of 'CompanyEditProfileImports.dart';

class CompanyEditProfile extends StatefulWidget {
  @override
  _CompanyEditProfileState createState() => _CompanyEditProfileState();
}

class _CompanyEditProfileState extends State<CompanyEditProfile> {
  final CompanyEditProfileData companyEditProfileData =
      new CompanyEditProfileData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        title: "الصفحة الشخصية",
      ),
      body: Column(
        children: [
          BuildEditText(),
          Flexible(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 10),
              children: [
                BuildProfileInfo(),
                BuildCompInfoDrop(
                    companyEditProfileData: companyEditProfileData),
                BuildMainDrop(companyEditProfileData: companyEditProfileData),
                BuildDescDrop(companyEditProfileData: companyEditProfileData),
                BuildInterestDrop(
                    companyEditProfileData: companyEditProfileData),
                BuildBranchDrop(companyEditProfileData: companyEditProfileData),
                BuildSocialDrop(companyEditProfileData: companyEditProfileData),
                BuildAddImageDrop(
                    companyEditProfileData: companyEditProfileData),
                BuildAddFileDrop(
                    companyEditProfileData: companyEditProfileData),
                BuildCertificateDrop(
                    companyEditProfileData: companyEditProfileData),
                BuildPartnerDrop(
                    companyEditProfileData: companyEditProfileData),
                DefaultButton(
                  title: "تغيير كلمة المرور",
                  onTap: () {},
                  color: MyColors.white,
                  textColor: MyColors.darken,
                  borderRadius: BorderRadius.circular(25),
                ),
                DefaultButton(
                  title: "حفظ التعديلات",
                  onTap: () {},
                  textColor: MyColors.darken,
                  borderRadius: BorderRadius.circular(25),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
