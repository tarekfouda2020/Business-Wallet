part of 'EditProfileWidgetsImports.dart';

class BuildAddFileDrop extends StatelessWidget {
  final CompanyEditProfileData companyEditProfileData;

  BuildAddFileDrop({required this.companyEditProfileData});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
      bloc: companyEditProfileData.filesDropCubit,
      builder: (_, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuildShowDropItem(
              title: "ادراج ملف",
              onTap: () => companyEditProfileData.filesDropCubit
                  .onUpdateData(!state.data),
              showTextField: true,
              controller: companyEditProfileData.image,
              radioCubit: companyEditProfileData.showFilesCubit,
              companyEditProfileData: companyEditProfileData,
              genericCubit: companyEditProfileData.filesDropCubit,
            ),
            Visibility(
              visible: state.data,
              child: BlocBuilder<GenericCubit<File?>, GenericState<File?>>(
                bloc: companyEditProfileData.fileCubit,
                builder: (_, state) {
                  if (state is GenericUpdateState) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                            child: InkWell(
                          onTap: () => companyEditProfileData.setFile(),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 7),
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            width: 200,
                            decoration: BoxDecoration(
                              color: MyColors.grey,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MyText(
                                  title: "اضغظ لتحميل ملف",
                                  color: MyColors.darken,
                                  size: 11,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  MdiIcons.download,
                                  color: MyColors.primary,
                                  size: 30,
                                ),
                              ],
                            ),
                          ),
                        )),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          child: Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            alignment: WrapAlignment.start,
                            children: List.generate(
                              3,
                              (index) => BuildCertificateItem(
                                genericCubit: companyEditProfileData.fileCubit,
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  } else {
                    return Center(
                        child: InkWell(
                      onTap: () => companyEditProfileData.setFile(),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 7),
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        width: 200,
                        decoration: BoxDecoration(
                          color: MyColors.grey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyText(
                              title: "اضغظ لتحميل ملف",
                              color: MyColors.darken,
                              size: 11,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              MdiIcons.download,
                              color: MyColors.primary,
                              size: 30,
                            ),
                          ],
                        ),
                      ),
                    ));
                  }
                },
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
