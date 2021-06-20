part of 'DetailsWidgetsImports.dart';

class BuildImgDrop extends StatelessWidget {
  final CompanyMainDetailsData companyMainDetailsData;
  final DetailsModel? detailsModel;
  BuildImgDrop({required this.companyMainDetailsData,required this.detailsModel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
      bloc: companyMainDetailsData.imagesDropCubit,
      builder: (_, state) {
        return Column(
          children: [
            BuildDropItem(
                title: "الصور",
                genericCubit: companyMainDetailsData.imagesDropCubit),
            Visibility(
              visible: state.data,
              child: BuildImagesData(products: detailsModel!.products,),
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
