part of 'CompFavDetailsWidgetsImports.dart';

class BuildAdsOwner extends StatelessWidget {
  final CompFavDetailsModel compFavDetailsModel;
  final CompanyFavDetailsData companyFavDetailsData;
  final int adsId;
  final int sendCard;
  final int showSendCard;

  const BuildAdsOwner({
    required this.compFavDetailsModel,
    required this.companyFavDetailsData,
    required this.adsId,
    required this.sendCard,
    required this.showSendCard,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BuildAdsItem(title: "صاحب الاعلان"),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => AutoRouter.of(context).push(
                  CompanyMainDetailsRoute(
                    kayanId: compFavDetailsModel.fk_kayan,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: MyColors.primary),
                      shape: BoxShape.circle),
                  padding: const EdgeInsets.all(5),
                  child: CachedImage(
                    url: compFavDetailsModel.img,
                    width: 55,
                    height: 55,
                    haveRadius: false,
                    boxShape: BoxShape.circle,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 3,
                child: InkWell(
                  onTap: () => AutoRouter.of(context).push(
                    CompanyMainDetailsRoute(
                      kayanId: compFavDetailsModel.fk_kayan,
                    ),
                  ),
                  child: MyText(
                    title: compFavDetailsModel.name,
                    size: 11,
                    color: MyColors.white,
                  ),
                ),
              ),
              InkWell(
                onTap: () => companyFavDetailsData.addOrRemoveLikeAds(
                  context,
                  adsId,
                  sendCard,
                  showSendCard,
                ),
                child: Container(
                  height: 30,
                  width: 30,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: MyColors.black, shape: BoxShape.circle),
                  alignment: Alignment.center,
                  child: Icon(
                    compFavDetailsModel.wishDB == true
                        ? Icons.favorite
                        : Icons.favorite_border,
                    size: 17,
                  ),
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () => companyFavDetailsData.addOrRemoveFollowAds(
                  context,
                  compFavDetailsModel.fk_kayan,
                  adsId,
                  sendCard,
                  showSendCard,
                ),
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: MyColors.primary,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: MyText(
                    title: compFavDetailsModel.followDB
                        ? "الغاء المتابعة"
                        : "متابعة",
                    size: 9,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
