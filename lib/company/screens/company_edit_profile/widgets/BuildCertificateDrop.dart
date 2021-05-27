part of 'EditProfileWidgetsImports.dart';

class BuildCertificateDrop extends StatelessWidget {
  final CompanyEditProfileData companyEditProfileData;

  BuildCertificateDrop({required this.companyEditProfileData});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
      bloc: companyEditProfileData.certificateDropCubit,
      builder: (_, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuildShowDropItem(
              title: "شهادات الاعتماد",
              onTap: () => companyEditProfileData.certificateDropCubit
                  .onUpdateData(!state.data),
              radioCubit: companyEditProfileData.showCertificateCubit,
              companyEditProfileData: companyEditProfileData,
              genericCubit: companyEditProfileData.certificateDropCubit,
            ),
            Visibility(
              visible: state.data,
              child: BlocBuilder<GenericCubit<File?>, GenericState<File?>>(
                bloc: companyEditProfileData.certificateCubit,
                builder: (_, state) {
                  if (state is GenericUpdateState) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: IconButton(
                            icon: Icon(
                              MdiIcons.plusCircle,
                              color: MyColors.primary,
                              size: 45,
                            ),
                            onPressed: () =>
                                companyEditProfileData.setCertificate(),
                          ),
                        ),
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
                                genericCubit:
                                    companyEditProfileData.certificateCubit,
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  } else {
                    return Center(
                      child: IconButton(
                        icon: Icon(
                          MdiIcons.plusCircle,
                          color: MyColors.primary,
                          size: 45,
                        ),
                        onPressed: () =>
                            companyEditProfileData.setCertificate(),
                      ),
                    );
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
