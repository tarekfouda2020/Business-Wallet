part of 'CompProfileWidgetsImports.dart';

class BuildImgDrop extends StatelessWidget {
  final CompanyProfileData companyProfileData;

  BuildImgDrop({required this.companyProfileData});

  @override
  Widget build(BuildContext context) {
    var company = context.read<UserCubit>().state.model.companyModel;

    return BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
      bloc: companyProfileData.imagesDropCubit,
      builder: (_, state) {
        return Column(
          children: [
            BuildDropItem(
                title: "الصور",
                genericCubit: companyProfileData.imagesDropCubit),
            Visibility(
              visible: state.data,
              child: Visibility(
                visible: company!.imgkayan!.isEmpty,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: MyText(
                    title: "لا يوجد صور",
                    size: 12,
                    color: MyColors.white,
                  ),
                ),
                replacement: BuildImagesData(),
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
