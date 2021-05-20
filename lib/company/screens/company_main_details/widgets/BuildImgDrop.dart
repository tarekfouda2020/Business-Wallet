part of 'DetailsWidgetsImports.dart';

class BuildImgDrop extends StatelessWidget {
  final CompanyMainDetailsData companyMainDetailsData;

  BuildImgDrop({required this.companyMainDetailsData});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
      bloc: companyMainDetailsData.imagesDropCubit,
      builder: (_, state) {
        return Column(
          children: [
            BuildDropItem(
                title: "معلومات التواصل",
                onTap: () => companyMainDetailsData.imagesDropCubit
                    .onUpdateData(!state.data),
                genericCubit: companyMainDetailsData.imagesDropCubit),
            Visibility(
              visible: state.data,
              child: BuildImagesData(),
              replacement: Container(),
            ),
          ],
        );
      },
    );
  }
}
