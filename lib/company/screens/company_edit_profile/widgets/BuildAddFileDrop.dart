part of 'EditProfileWidgetsImports.dart';

class BuildAddFileDrop extends StatelessWidget {
  final CompanyEditProfileData companyEditProfileData;

  BuildAddFileDrop({required this.companyEditProfileData});

  @override
  Widget build(BuildContext context) {
    var company = context.read<UserCubit>().state.model.companyModel;

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
              controller: companyEditProfileData.file,
              radioCubit: companyEditProfileData.showFilesCubit,
              companyEditProfileData: companyEditProfileData,
              genericCubit: companyEditProfileData.filesDropCubit,
            ),
            Visibility(
              visible: state.data,
              child: Column(
                children: [
                  Center(
                    child: InkWell(
                      onTap: companyEditProfileData.setFile,
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
                    ),
                  ),
                  BlocBuilder<GenericCubit<File?>, GenericState<File?>>(
                    bloc: companyEditProfileData.fileCubit,
                    builder: (_, fileState) {
                      if (fileState.data == null) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.all(15),
                              child: InkWell(
                                onTap: () =>
                                    Utils.launchURL(url: company!.pdfKayan!),
                                child: MyText(
                                  title: company!.pdfKayan!.split("/").last,
                                  size: 13,
                                  color: MyColors.white,
                                ),
                              ),
                            )
                          ],
                        );
                      } else {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 10),
                              child: Row(
                                children: [
                                  MyText(
                                    title: fileState.data!.path.split("/").last,
                                    size: 13,
                                    color: MyColors.white,
                                  ),
                                  InkWell(
                                    onTap: companyEditProfileData.removeFile,
                                    child: Icon(
                                      Icons.cancel,
                                      size: 30,
                                      color: MyColors.primary,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        );
                      }
                    },
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
