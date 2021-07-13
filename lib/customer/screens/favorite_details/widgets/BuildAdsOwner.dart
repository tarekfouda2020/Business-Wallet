part of 'FavoriteDetailsWidgetsImports.dart';

class BuildAdsOwner extends StatelessWidget {
  final KayanOwnerModel kayanOwnerModel;
  final InvestmentAdsDetailsModel adsDetailsModel;
  final FavoriteDetailsData favoriteDetailsData;

  const BuildAdsOwner(
      {required this.kayanOwnerModel,
      required this.adsDetailsModel,
      required this.favoriteDetailsData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          InkWell(
            onTap: () => AutoRouter.of(context)
                .push(ProviderDetailsRoute(kayanId: kayanOwnerModel.id)),
            child: BuildInvPic(
              image: kayanOwnerModel.image,
            ),
          ),
          Flexible(
            child: InkWell(
              onTap: () => AutoRouter.of(context)
                  .push(ProviderDetailsRoute(kayanId: kayanOwnerModel.id)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    title: kayanOwnerModel.name,
                    size: 11,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 15,
                        color: MyColors.primary,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      MyText(
                        title: kayanOwnerModel.addressKayan ?? "",
                        size: 9,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () => favoriteDetailsData.addOrRemoveFollow(
                context, kayanOwnerModel.id, adsDetailsModel.id),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: MyColors.primary,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: MyText(
                title: adsDetailsModel.follow == true
                    ? "الغاء المتابعة"
                    : "متابعة",
                size: 11,
                color: MyColors.blackOpacity,
              ),
            ),
          )
        ],
      ),
    );
  }
}
