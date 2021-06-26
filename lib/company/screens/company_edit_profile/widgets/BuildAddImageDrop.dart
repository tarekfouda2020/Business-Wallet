part of 'EditProfileWidgetsImports.dart';

class BuildAddImageDrop extends StatelessWidget {
  final CompanyEditProfileData companyEditProfileData;

  BuildAddImageDrop({required this.companyEditProfileData});

  @override
  Widget build(BuildContext context) {
    var company = context.read<UserCubit>().state.model.companyModel;

    return BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
      bloc: companyEditProfileData.imagesDropCubit,
      builder: (_, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuildShowDropItem(
              title: "ادراج صورة",
              onTap: () => companyEditProfileData.imagesDropCubit
                  .onUpdateData(!state.data),
              showTextField: true,
              controller: companyEditProfileData.image,
              radioCubit: companyEditProfileData.showImagesCubit,
              companyEditProfileData: companyEditProfileData,
              genericCubit: companyEditProfileData.imagesDropCubit,
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
                      onPressed: companyEditProfileData.addImage,
                    ),
                  ),
                  BlocBuilder<GenericCubit<List<File>>,
                      GenericState<List<File>>>(
                    bloc: companyEditProfileData.addImgCubit,
                    builder: (_, fileState) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin:const EdgeInsets.symmetric(vertical: 10),
                            child: Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              alignment: WrapAlignment.start,
                              children: [
                                ...company!.imgkayan!.map(
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
                                            .removeExistImage(context, e),
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
                                          companyEditProfileData.removeImage(e),
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
