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
                  Container(
                    constraints: BoxConstraints(
                        minHeight: 55,
                        maxHeight: 80,
                        minWidth: double.infinity,
                        maxWidth: double.infinity),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: MyColors.black),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: MyText(title: "السعودية"),
                  ),
                  BuildFormText(text: "المنطقه"),
                  DropdownTextField<CitiesModel>(
                    dropKey: companyEditProfileData.city,
                    label: "المنطقة",
                    selectedItem: companyEditProfileData.cityId,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    validate: (CitiesModel value) =>
                        value.validateDropDown(context),
                    onChange: companyEditProfileData.onSelectCities,
                    useName: true,
                    finData: (filter) async =>
                        await CustomerRepository(context).getCities(3),
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
