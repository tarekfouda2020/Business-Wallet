part of 'DetailsWidgetsImports.dart';

class BuildShowDescription extends StatelessWidget {
  final CompanyMainDetailsData companyMainDetailsData;
  final DetailsModel? detailsModel;

  const BuildShowDescription(
      {required this.companyMainDetailsData, required this.detailsModel});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: detailsModel!.showDescriptionKayan,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
              title: "وصف الكيان",
              color: MyColors.primary,
            ),
            MyText(
              title: detailsModel!.descriptionText,
              size: 10,
              color: MyColors.grey,
            ),
          ],
        ),
      ),
      replacement: Container(),
    );
  }
}
