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
                genericCubit: companyEditProfileData.compInfoDropCubit),
            Visibility(
              visible: state.data,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BuildFormText(text: "اسم المستخدم"),
                  IconTextFiled(
                    hint: "اسم المستخدم",
                    controller: companyEditProfileData.userName,
                    action: TextInputAction.next,
                    type: TextInputType.emailAddress,
                    suffixIcon: Icon(
                      Icons.edit,
                      size: 20,
                    ),
                    margin: EdgeInsets.symmetric(vertical: 10),
                    validate: (value) => value!.validateEmpty(context),
                  ),
                  BuildFormText(text: "رقم الجوال"),
                  IconTextFiled(
                    hint: "رقم الجوال",
                    controller: companyEditProfileData.phone,
                    action: TextInputAction.next,
                    type: TextInputType.emailAddress,
                    suffixIcon: Icon(
                      Icons.edit,
                      size: 20,
                    ),
                    margin: EdgeInsets.symmetric(vertical: 10),
                    validate: (value) => value!.validateEmpty(context),
                  ),
                  BuildFormText(text: "البريد الالكتروني"),
                  IconTextFiled(
                    hint: "البريد الالكتروني",
                    controller: companyEditProfileData.email,
                    action: TextInputAction.next,
                    type: TextInputType.emailAddress,
                    suffixIcon: Icon(
                      Icons.edit,
                      size: 20,
                    ),
                    margin: EdgeInsets.symmetric(vertical: 10),
                    validate: (value) => value!.validateEmpty(context),
                  ),
                  BuildFormText(text: "الدولة"),
                  InkWellTextField(
                    controller: companyEditProfileData.city,
                    hint: "السعودية",
                    onTab: () {},
                    margin: EdgeInsets.symmetric(vertical: 10),
                    validate: (value) => value!.validateEmpty(context),
                  ),
                  BuildFormText(text: "المنطقة"),
                  DropdownTextField<DropDownModel>(
                    dropKey: companyEditProfileData.country,
                    hint: "المنطقة",
                    borderRadius: 80,
                    validate: (DropDownModel value) => value.validateDropDown(context),
                    margin: EdgeInsets.symmetric(vertical: 10),
                    onChange: companyEditProfileData.changeRegion,
                    // data: ,
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
