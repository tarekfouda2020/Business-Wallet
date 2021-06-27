part of 'EditProfileWidgetsImports.dart';

class BuildCertificateDrop extends StatelessWidget {
  final CompanyEditProfileData companyEditProfileData;

  BuildCertificateDrop({required this.companyEditProfileData});

  @override
  Widget build(BuildContext context) {
    var company = context.read<UserCubit>().state.model.companyModel;

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
              child: Column(
                children: [
                  Center(
                    child: IconButton(
                      icon: Icon(
                        MdiIcons.plusCircle,
                        color: MyColors.primary,
                        size: 45,
                      ),
                      onPressed: companyEditProfileData.addCertificate,
                    ),
                  ),
                  BlocBuilder<GenericCubit<List<File>>,
                      GenericState<List<File>>>(
                    bloc: companyEditProfileData.certificateCubit,
                    builder: (_, fileState) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10),
                            child: Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              alignment: WrapAlignment.start,
                              children: [
                                ...company!.accreditationKayan!.map(
                                      (e) => Container(

                                    width: 100,
                                    height: 100,
                                    child: CachedImage(
                                      alignment: Alignment.topLeft,
                                      url: e.img!,
                                      borderColor: MyColors.greyWhite,
                                      borderRadius: BorderRadius.circular(10),
                                      width: MediaQuery.of(context).size.width,
                                      height: 150,
                                      child: InkWell(
                                        onTap: () => companyEditProfileData
                                            .removeExistCertificate(context, e),
                                        child: Icon(
                                          Icons.cancel,
                                          size: 30,
                                          color: MyColors.primary,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                ...fileState.data.map(
                                      (e) => Container(
                                    alignment: Alignment.topLeft,
                                    width: 100,
                                    height: 100,
                                    child: InkWell(
                                      onTap: () =>
                                          companyEditProfileData.removeCertificate(e),
                                      child: Icon(
                                        Icons.cancel,
                                        size: 30,
                                        color: MyColors.primary,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: MyColors.grey, width: 1),
                                      borderRadius:
                                      BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: FileImage(e),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      );
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
