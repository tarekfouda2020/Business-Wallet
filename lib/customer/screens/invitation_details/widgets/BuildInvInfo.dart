part of 'InvDetailsWidgetsImports.dart';

class BuildInvInfo extends StatelessWidget {
  final AdsDetailsModel adsDetailsModel;
  final InvitationDetailsData invitationDetailsData;
  final KayanOwnerModel kayanOwnerModel;

  const BuildInvInfo(
      {required this.adsDetailsModel,
      required this.invitationDetailsData,
      required this.kayanOwnerModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: MyText(
                  title: adsDetailsModel.nameAds,
                  size: 12,
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
                      onTap: () => invitationDetailsData.addOrRemoveLike(
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
