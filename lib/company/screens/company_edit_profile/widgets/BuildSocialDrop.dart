part of 'EditProfileWidgetsImports.dart';

class BuildSocialDrop extends StatelessWidget {
  final CompanyEditProfileData companyEditProfileData;

  BuildSocialDrop({required this.companyEditProfileData});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
      bloc: companyEditProfileData.socialDropCubit,
      builder: (_, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuildDropItem(
                title: "روابط التواصل الاجتماعي",
                genericCubit: companyEditProfileData.socialDropCubit),
            Visibility(
              visible: state.data,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BuildFormText(text: "رقم الواتساب"),
                  IconTextFiled(
                    hint: "رقم الواتساب",
                    controller: companyEditProfileData.whatsApp,
                    action: TextInputAction.next,
                    type: TextInputType.emailAddress,
                    suffixIcon: Icon(
                      Icons.edit,
                      size: 20,
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    validate: (value) => value!.validateEmpty(context),
                  ),
                  BuildFormText(text: "الانستقرام"),
                  IconTextFiled(
                    hint: "الانستقرام",
                    controller: companyEditProfileData.instagram,
                    action: TextInputAction.next,
                    type: TextInputType.emailAddress,
                    suffixIcon: Icon(
                      Icons.edit,
                      size: 20,
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    validate: (value) => value!.validateEmpty(context),
                  ),
                  BuildFormText(text: "تويتر"),
                  IconTextFiled(
                    hint: "تويتر",
                    controller: companyEditProfileData.twitter,
                    action: TextInputAction.next,
                    type: TextInputType.emailAddress,
                    suffixIcon: Icon(
                      Icons.edit,
                      size: 20,
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    validate: (value) => value!.validateEmpty(context),
                  ),
                  BuildFormText(text: "فيسبوك"),
                  IconTextFiled(
                    hint: "فيسبوك",
                    controller: companyEditProfileData.facebook,
                    action: TextInputAction.next,
                    type: TextInputType.emailAddress,
                    suffixIcon: Icon(
                      Icons.edit,
                      size: 20,
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    validate: (value) => value!.validateEmpty(context),
                  ),
                  BuildFormText(text: "جوجل بلس"),
                  IconTextFiled(
                    hint: "جوجل بلس",
                    controller: companyEditProfileData.google,
                    action: TextInputAction.next,
                    type: TextInputType.emailAddress,
                    suffixIcon: Icon(Icons.keyboard_arrow_down_rounded),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    validate: (value) => value!.validateEmpty(context),
                  ),
                ],
              ),
              replacement: Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
              ),
            ),
          ],
        );
      },
    );
  }
}
