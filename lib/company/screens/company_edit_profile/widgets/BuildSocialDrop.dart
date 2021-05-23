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
                onTap: () => companyEditProfileData.socialDropCubit
                    .onUpdateData(!state.data),
                genericCubit: companyEditProfileData.socialDropCubit),
            Visibility(
              visible: state.data,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                    child: MyText(
                      title: "رقم الواتساب",
                      size: 11,
                      color: MyColors.white,
                    ),
                  ),
                  IconTextFiled(
                    hint: "رقم الواتساب",
                    controller: companyEditProfileData.whatsApp,
                    action: TextInputAction.next,
                    type: TextInputType.emailAddress,
                    suffixIcon: Icon(
                      Icons.edit,
                      size: 20,
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    validate: (value) => value!.validateEmpty(context),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: MyText(
                      title: "الانستقرام",
                      size: 11,
                      color: MyColors.white,
                    ),
                  ),
                  IconTextFiled(
                    hint: "الانستقرام",
                    controller: companyEditProfileData.instagram,
                    action: TextInputAction.next,
                    type: TextInputType.emailAddress,
                    suffixIcon: Icon(
                      Icons.edit,
                      size: 20,
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    validate: (value) => value!.validateEmpty(context),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: MyText(
                      title: "تويتر",
                      size: 11,
                      color: MyColors.white,
                    ),
                  ),
                  IconTextFiled(
                    hint: "تويتر",
                    controller: companyEditProfileData.twitter,
                    action: TextInputAction.next,
                    type: TextInputType.emailAddress,
                    suffixIcon: Icon(
                      Icons.edit,
                      size: 20,
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    validate: (value) => value!.validateEmpty(context),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: MyText(
                      title: "فيسبوك",
                      size: 11,
                      color: MyColors.white,
                    ),
                  ),
                  IconTextFiled(
                    hint: "فيسبوك",
                    controller: companyEditProfileData.facebook,
                    action: TextInputAction.next,
                    type: TextInputType.emailAddress,
                    suffixIcon: Icon(
                      Icons.edit,
                      size: 20,
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    validate: (value) => value!.validateEmpty(context),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: MyText(
                      title: "جوجل بلس",
                      size: 11,
                      color: MyColors.white,
                    ),
                  ),
                  IconTextFiled(
                    hint: "جوجل بلس",
                    controller: companyEditProfileData.google,
                    action: TextInputAction.next,
                    type: TextInputType.emailAddress,
                    suffixIcon: Icon(Icons.keyboard_arrow_down_rounded),
                    margin: const EdgeInsets.symmetric(vertical: 5),
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
