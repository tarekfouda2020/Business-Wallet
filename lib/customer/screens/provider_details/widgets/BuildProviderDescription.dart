part of 'ProviderDetailsWidgetsImports.dart';

class BuildProviderDescription extends StatelessWidget {
  final ProviderDetailsData providerDetailsData;
  final DetailsModel? detailsModel;

  const BuildProviderDescription(
      {required this.providerDetailsData, required this.detailsModel});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: detailsModel!.showDescriptionKayan,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
              title: "وصف الكيان",
              color: MyColors.primary,
            ),
            Container(
              child: MyText(
                title: detailsModel!.description,
                size: 10,
                color: MyColors.grey,
              ),
            ),
          ],
        ),
      ),
      replacement: Container(),
    );
  }
}
