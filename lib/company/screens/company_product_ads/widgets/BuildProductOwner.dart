part of 'CompProductAdsWidgetsImports.dart';

class BuildProductOwner extends StatelessWidget {
  final KayanOwnerModel kayanOwnerModel;
  final InvestmentAdsDetailsModel adsDetailsModel;
  final CompProductAdsData compProductAdsData;

  const BuildProductOwner(
      {required this.kayanOwnerModel,
      required this.adsDetailsModel,
      required this.compProductAdsData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          InkWell(
            onTap: () => AutoRouter.of(context).push(
              CompanyMainDetailsRoute(kayanId: kayanOwnerModel.id),
            ),
            child: Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: MyColors.primary),
              ),
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: CachedImage(
                url: kayanOwnerModel.image,
                haveRadius: false,
                width: 55,
                height: 55,
                borderColor: MyColors.white,
                boxShape: BoxShape.circle,
              ),
            ),
          ),
          Flexible(
            child: InkWell(
              onTap: () => AutoRouter.of(context).push(
                CompanyMainDetailsRoute(kayanId: kayanOwnerModel.id),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    title: kayanOwnerModel.name,
                    size: 11,
                  ),
                  // Row(
                  //   children: [
                  //     Icon(
                  //       Icons.location_on,
                  //       size: 15,
                  //       color: MyColors.primary,
                  //     ),
                  //     SizedBox(
                  //       width: 5,
                  //     ),
                  //     MyText(
                  //       title: kayanOwnerModel.addressKayan,
                  //       size: 9,
                  //     ),
                  //   ],
                  // )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
