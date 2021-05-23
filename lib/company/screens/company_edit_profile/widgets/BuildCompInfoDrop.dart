part of 'EditProfileWidgetsImports.dart';

class BuildCompInfoDrop extends StatelessWidget {
  final CompanyEditProfileData companyEditProfileData;

  BuildCompInfoDrop({required this.companyEditProfileData});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
      bloc: companyEditProfileData.compInfoDropCubit,
      builder: (_, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuildDropItem(
                title: "معلومات المنشأة التجارية",
                onTap: () => companyEditProfileData.compInfoDropCubit
                    .onUpdateData(!state.data),
                genericCubit: companyEditProfileData.compInfoDropCubit),
            Visibility(
              visible: state.data,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                    child: MyText(
                      title: "اسم المستخدم",
                      size: 11,
                      color: MyColors.white,
                    ),
                  ),
                  IconTextFiled(
                    hint: "اسم المستخدم",
                    controller: companyEditProfileData.userName,
                    action: TextInputAction.next,
                    type: TextInputType.emailAddress,
                    suffixIcon: Icon(Icons.edit,size: 20,),
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    validate: (value) => value!.validateEmpty(context),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: MyText(
                      title: "رقم الجوال",
                      size: 11,
                      color: MyColors.white,
                    ),
                  ),
                  IconTextFiled(
                    hint: "رقم الجوال",
                    controller: companyEditProfileData.phone,
                    action: TextInputAction.next,
                    type: TextInputType.emailAddress,
                    suffixIcon: Icon(Icons.edit,size: 20,),
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    validate: (value) => value!.validateEmpty(context),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: MyText(
                      title: "البريد الالكتروني",
                      size: 11,
                      color: MyColors.white,
                    ),
                  ),
                  IconTextFiled(
                    hint: "البريد الالكتروني",
                    controller: companyEditProfileData.email,
                    action: TextInputAction.next,
                    type: TextInputType.emailAddress,
                    suffixIcon: Icon(Icons.edit,size: 20,),
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    validate: (value) => value!.validateEmpty(context),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: MyText(
                      title: "الدولة",
                      size: 11,
                      color: MyColors.white,
                    ),
                  ),
                  InkWellTextField(
                    controller: companyEditProfileData.city,
                    hint: "السعودية",
                    onTab: () {},
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    validate: (value) => value!.validateEmpty(context),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: MyText(
                      title: "المنطقة",
                      size: 11,
                      color: MyColors.white,
                    ),
                  ),
                  IconTextFiled(
                    hint: "المنطقة",
                    controller: companyEditProfileData.country,
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
