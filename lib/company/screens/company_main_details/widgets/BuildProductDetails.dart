part of 'DetailsWidgetsImports.dart';

class BuildProductDetails extends StatelessWidget {
  final DetailsModel? detailsModel;
  final CompanyMainDetailsData companyMainDetailsData;

  const BuildProductDetails(
      {required this.detailsModel, required this.companyMainDetailsData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              border: Border.all(
                color: MyColors.primary,
              ),
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(6),
            child: CachedImage(
              url: detailsModel!.baseImg,
              haveRadius: false,
              width: 50,
              height: 50,
              boxShape: BoxShape.circle,
            ),
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
                onTap: () => companyMainDetailsData.addOrRemoveLike(
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
          Column(
            children: [
              InkWell(
                onTap: () => companyMainDetailsData.sendBrochure(
                    context, detailsModel!.kayanId),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: MyColors.primary,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: MyText(
                    title: "ارسال بروشور",
                    size: 9,
                    color: Colors.black,
                  ),
                ),
              ),
              InkWell(
                onTap: () => companyMainDetailsData.addOrRemoveFollow(
                    context, detailsModel!.kayanId),
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: MyColors.primary,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: MyText(
                    title: detailsModel!.follow ? "الغاء المتابعة" : "متابعة",
                    size: 9,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
