part of 'EditProfileWidgetsImports.dart';

class BuildMainDrop extends StatelessWidget {
  final CompanyEditProfileData companyEditProfileData;

  BuildMainDrop({required this.companyEditProfileData});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
      bloc: companyEditProfileData.mainDropCubit,
      builder: (_, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuildDropItem(
                title: "الصفحة الرئيسية",
                genericCubit: companyEditProfileData.mainDropCubit),
            Visibility(
              visible: state.data,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BuildFormText(text: "اسم المنشأة"),
                  IconTextFiled(
                    hint: "اسم المنشأة",
                    controller: companyEditProfileData.compName,
                    action: TextInputAction.next,
                    type: TextInputType.emailAddress,
                    suffixIcon: Icon(
                      Icons.edit,
                      size: 20,
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    validate: (value) => value!.validateEmpty(context),
                  ),
                  BuildFormText(text: "رقم الهاتف"),
                  IconTextFiled(
                    hint: "رقم الهاتف",
                    controller: companyEditProfileData.compPhone,
                    action: TextInputAction.next,
                    type: TextInputType.emailAddress,
                    suffixIcon: Icon(
                      Icons.edit,
                      size: 20,
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    validate: (value) => value!.validateEmpty(context),
                  ),
                  BuildFormText(text: "البريد الالكتروني"),
                  IconTextFiled(
                    hint: "البريد الالكتروني",
                    controller: companyEditProfileData.compEmail,
                    action: TextInputAction.next,
                    type: TextInputType.emailAddress,
                    suffixIcon: Icon(
                      Icons.edit,
                      size: 20,
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    validate: (value) => value!.validateEmpty(context),
                  ),
                  BuildFormText(text: "موقع الفرع الرئيسي"),
                  BlocConsumer<LocationCubit, LocationState>(
                    bloc: companyEditProfileData.locCubit,
                    listener: (_, state) {
                      companyEditProfileData.compLocation.text =
                          state.model!.address;
                      companyEditProfileData.lat = state.model!.lat;
                      companyEditProfileData.lng = state.model!.lng;
                    },
                    builder: (_, state) {
                      return InkWellTextField(
                        controller: companyEditProfileData.compLocation,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        hint: 'موقع الفرع الرئيسي',
                        type: TextInputType.text,
                        icon: Icon(
                          Icons.gps_fixed,
                          size: 20,
                          color: MyColors.primary,
                        ),
                        validate: (value) => value!.validateEmpty(context),
                        onTab: () => Utils.navigateToLocationAddress(
                            context, companyEditProfileData.locCubit),
                      );
                    },
                  ),

                  BuildFormText(text: "الموقع الالكتروني"),
                  IconTextFiled(
                    hint: "الموقع الالكتروني",
                    controller: companyEditProfileData.compWebsite,
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
