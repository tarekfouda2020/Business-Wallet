part of 'CompSpecificAdsWidgetsImports.dart';

class BuildOwnerAds extends StatelessWidget {
  final KayanOwnerModel kayanOwnerModel;
  final AdsDetailsModel adsDetailsModel;
  final CompSpecificAdsData compSpecificAdsData;

  const BuildOwnerAds(
      {required this.kayanOwnerModel,
      required this.adsDetailsModel,
      required this.compSpecificAdsData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: MyColors.primary)),
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
          Flexible(
            child: MyText(
              title: kayanOwnerModel.name,
              size: 11,
            ),
          ),
          Spacer(),
          Offstage(
            offstage: adsDetailsModel.business,
            child: InkWell(
              onTap: () => compSpecificAdsData.addOrRemoveFollow(
                  context, kayanOwnerModel.id, adsDetailsModel.id),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: MyColors.primary,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: MyText(
                  title: adsDetailsModel.follow == true
                      ? "الغاء المتابعة"
                      : "متابعة",
                  size: 11,
                  color: MyColors.blackOpacity,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
