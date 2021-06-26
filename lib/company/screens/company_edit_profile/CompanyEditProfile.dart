part of 'CompanyEditProfileImports.dart';

class CompanyEditProfile extends StatefulWidget {
  @override
  _CompanyEditProfileState createState() => _CompanyEditProfileState();
}

class _CompanyEditProfileState extends State<CompanyEditProfile> {
  final CompanyEditProfileData companyEditProfileData =
      new CompanyEditProfileData();

  @override
  void initState() {
    companyEditProfileData.seInitialData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var companyId = context.read<UserCubit>().state.model.companyModel!.userId;

    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        title: "الصفحة الشخصية",
      ),
      body: Column(
        children: [
          BuildEditText(),
          Flexible(
            child: Form(
              key: companyEditProfileData.formKey,
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 10),
                children: [
                  BuildProfileInfo(
                    companyEditProfileData: companyEditProfileData,
                  ),
                  BuildCompInfoDrop(
                      companyEditProfileData: companyEditProfileData),
                  BuildMainDrop(companyEditProfileData: companyEditProfileData),
                  BuildDescDrop(companyEditProfileData: companyEditProfileData),
                  BuildInterestDrop(
                      companyEditProfileData: companyEditProfileData),
                  BuildBranchDrop(
                      companyEditProfileData: companyEditProfileData),
                  BuildSocialDrop(
                      companyEditProfileData: companyEditProfileData),
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
                    onTap: () => AutoRouter.of(context)
                        .push(ChangePasswordRoute(userId: companyId)),
                    color: MyColors.white,
                    textColor: MyColors.darken,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  LoadingButton(
                    btnKey: companyEditProfileData.btnKey,
                    title: "حفظ التعديلات",
                    onTap: () =>
                        companyEditProfileData.updateCompanyData(context),
                    textColor: MyColors.darken,
                    borderRadius: 25,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
