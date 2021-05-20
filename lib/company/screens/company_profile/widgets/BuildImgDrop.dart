part of 'CompProfileWidgetsImports.dart';
class BuildImgDrop extends StatelessWidget {
  final CompanyProfileData companyProfileData;

  BuildImgDrop({required this.companyProfileData});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
      bloc: companyProfileData.imagesDropCubit,
      builder: (_, state) {
        return Column(
          children: [
            BuildDropItem(
                title: "الصور",
                onTap: () => companyProfileData.imagesDropCubit
                    .onUpdateData(!state.data),
                genericCubit: companyProfileData.imagesDropCubit),
            Visibility(
              visible: state.data,
              child: BuildImagesData(),
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
