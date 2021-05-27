part of 'EditProfileWidgetsImports.dart';

class BuildDescDrop extends StatelessWidget {
  final CompanyEditProfileData companyEditProfileData;

  BuildDescDrop({required this.companyEditProfileData});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
      bloc: companyEditProfileData.descDropCubit,
      builder: (_, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuildShowDropItem(
              title: "حالة الخانة",
              onTap: () => companyEditProfileData.descDropCubit
                  .onUpdateData(!state.data),
              radioCubit: companyEditProfileData.showDescCubit,
              companyEditProfileData: companyEditProfileData,
              genericCubit: companyEditProfileData.descDropCubit,
            ),
            Visibility(
              visible: state.data,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BuildFormText(text: "الوصف"),
                  RichTextFiled(
                    hint: "الوصف",
                    controller: companyEditProfileData.desc,
                    action: TextInputAction.next,
                    type: TextInputType.multiline,
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    validate: (value) => value!.validateEmpty(context),
                    max: 3,
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
