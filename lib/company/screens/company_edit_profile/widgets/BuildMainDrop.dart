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
                onTap: () => companyEditProfileData.mainDropCubit
                    .onUpdateData(!state.data),
                genericCubit: companyEditProfileData.mainDropCubit),
            Visibility(
              visible: state.data,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                    child: MyText(
                      title: "اسم المنشأة",
                      size: 11,
                      color: MyColors.white,
                    ),
                  ),
                  IconTextFiled(
                    hint: "اسم المنشأة",
                    controller: companyEditProfileData.compName,
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
                      title: "رقم الهاتف",
                      size: 11,
                      color: MyColors.white,
                    ),
                  ),
                  IconTextFiled(
                    hint: "رقم الهاتف",
                    controller: companyEditProfileData.compPhone,
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
                    controller: companyEditProfileData.compEmail,
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
                      title: "موقع الفرع الرئيسي",
                      size: 11,
                      color: MyColors.white,
                    ),
                  ),
                  InkWellTextField(
                    controller: companyEditProfileData.city,
                    hint: "موقع الفرع الرئيسي",
                    onTab: () {},
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    validate: (value) => value!.validateEmpty(context),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: MyText(
                      title: "الموقع الالكتروني",
                      size: 11,
                      color: MyColors.white,
                    ),
                  ),
                  IconTextFiled(
                    hint: "الموقع الالكتروني",
                    controller: companyEditProfileData.compWebsite,
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
