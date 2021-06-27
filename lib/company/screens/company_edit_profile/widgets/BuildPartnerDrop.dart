part of 'EditProfileWidgetsImports.dart';

class BuildPartnerDrop extends StatelessWidget {
  final CompanyEditProfileData companyEditProfileData;

  BuildPartnerDrop({required this.companyEditProfileData});

  @override
  Widget build(BuildContext context) {
    var company = context.read<UserCubit>().state.model.companyModel;

    return BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
      bloc: companyEditProfileData.partnersDropCubit,
      builder: (_, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuildShowDropItem(
              title: "الشركاء",
              onTap: () => companyEditProfileData.partnersDropCubit
                  .onUpdateData(!state.data),
              radioCubit: companyEditProfileData.showPartnerCubit,
              companyEditProfileData: companyEditProfileData,
              genericCubit: companyEditProfileData.partnersDropCubit,
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
                      onPressed: companyEditProfileData.addPartner,
                    ),
                  ),
                  BlocBuilder<GenericCubit<List<File>>,
                      GenericState<List<File>>>(
                    bloc: companyEditProfileData.partnerCubit,
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
                                ...company!.partnersKayan!.map(
                                  (e) => Container(
                                    width: 100,
                                    height: 100,
                                    child: CachedImage(
                                      alignment: Alignment.topLeft,
                                      url: e.img!,
                                      borderColor: MyColors.greyWhite,
                                      borderRadius: BorderRadius.circular(10),
                                      width: 100,
                                      height: 100,
                                      child: InkWell(
                                        onTap: () => companyEditProfileData
                                            .removeExistPartner(context, e),
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
                                      onTap: () => companyEditProfileData
                                          .removePartner(e),
                                      child: Icon(
                                        Icons.cancel,
                                        size: 30,
                                        color: MyColors.primary,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: MyColors.grey, width: 1),
                                      borderRadius: BorderRadius.circular(10),
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
