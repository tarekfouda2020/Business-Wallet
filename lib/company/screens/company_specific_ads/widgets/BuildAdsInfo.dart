part of 'CompSpecificAdsWidgetsImports.dart';

class BuildAdsInfo extends StatelessWidget {
  final AdsDetailsModel adsDetailsModel;
  final CompSpecificAdsData compSpecificAdsData;
  final KayanOwnerModel kayanOwnerModel;

  const BuildAdsInfo(
      {required this.adsDetailsModel,
      required this.compSpecificAdsData,
      required this.kayanOwnerModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: MyText(
                  title: adsDetailsModel.nameAds,
                  size: 14,

                ),
              ),
              MyText(
                title: "( ${adsDetailsModel.countRate} )",
                size: 11,
                color: MyColors.white,
              ),
              SizedBox(width: 5),
              RatingBar.builder(
                itemCount: 5,
                allowHalfRating: true,
                ignoreGestures: true,
                onRatingUpdate: (double val) {},
                unratedColor: MyColors.white,
                itemSize: 12,
                itemPadding: const EdgeInsets.symmetric(vertical: 7),
                initialRating: adsDetailsModel.rateAds.toDouble(),
                itemBuilder: (_, index) {
                  return Icon(
                    Icons.star,
                    color: MyColors.primary,
                  );
                },
              ),
              SizedBox(width: 10),
              Container(
                child: Row(
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: MyColors.black, shape: BoxShape.circle),
                      alignment: Alignment.centerLeft,
                      child: Icon(
                        MdiIcons.shareVariant,
                        size: 18,
                      ),
                    ),
                    InkWell(
                      onTap: () => compSpecificAdsData.addOrRemoveLike(
                          context, adsDetailsModel.id),
                      child: Container(
                        height: 30,
                        width: 30,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: MyColors.black, shape: BoxShape.circle),
                        alignment: Alignment.center,
                        child: Icon(
                          adsDetailsModel.wish == true
                              ? Icons.favorite
                              : Icons.favorite_border,
                          size: 17,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Icon(
                  Icons.location_on,
                  size: 15,
                  color: MyColors.primary,
                ),
              ),
              MyText(
                title: kayanOwnerModel.addressKayan,
                size: 9,
              )
            ],
          )
        ],
      ),
    );
  }
}
