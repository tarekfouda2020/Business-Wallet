part of 'ProviderDetailsWidgetsImports.dart';

class BuildInformations extends StatelessWidget {
  final DetailsModel? detailsModel;
  final ProviderDetailsData providerDetailsData;

  BuildInformations(
      {required this.detailsModel, required this.providerDetailsData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BuildUserPhoto(
            baseImg: detailsModel!.baseImg,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    title: detailsModel!.kayanName,
                    size: 10,
                  ),
                  Row(
                    children: [
                      RatingBar.builder(
                        itemCount: 5,
                        allowHalfRating: true,
                        ignoreGestures: true,
                        onRatingUpdate: (double val) {},
                        unratedColor: MyColors.white,
                        itemSize: 12,
                        itemPadding: const EdgeInsets.symmetric(vertical: 7),
                        initialRating: detailsModel!.rate.toDouble(),
                        itemBuilder: (_, index) {
                          return Icon(
                            Icons.star,
                            color: MyColors.primary,
                          );
                        },
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      MyText(
                        title: "(${detailsModel!.countRate})",
                        size: 8,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              InkWell(
                onTap: () => providerDetailsData.addOrRemoveLike(
                    context, detailsModel!.kayanId),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: MyColors.black),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.thumb_up,
                    size: 13,
                    color: detailsModel!.like == true
                        ? MyColors.primary
                        : MyColors.white,
                  ),
                ),
              ),
              MyText(
                title: "${detailsModel!.countLike}",
                size: 9,
              )
            ],
          ),
          InkWell(
            onTap: () => providerDetailsData.addOrRemoveFollow(
                context, detailsModel!.kayanId),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: MyColors.primary,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: MyText(
                title: detailsModel!.follow ? "الغاء المتابعة" : "متابعة",
                size: 10,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }
}
