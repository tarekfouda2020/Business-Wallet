part of 'CompSpecificAdsWidgetsImports.dart';

class BuildAdsComments extends StatelessWidget {
  final CompSpecificAdsData compSpecificAdsData;
  final List<CommentModel> commentModel;

  const BuildAdsComments(
      {required this.compSpecificAdsData, required this.commentModel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
      bloc: compSpecificAdsData.commentCubit,
      builder: (context, state) {
        return ListView(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          children: [
            BuildDropItem(
              title: "التعليقات",
              genericCubit: compSpecificAdsData.commentCubit,
            ),
            Visibility(
              visible: state.data,
              child: Visibility(
                visible: commentModel.length > 0,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: commentModel.length,
                  itemBuilder: (_, index) {
                    return Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: MyColors.greyWhite)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 55,
                                width: 55,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: MyColors.primary),
                                ),
                                padding: const EdgeInsets.all(5),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: CachedImage(
                                  url: commentModel[index].ownerImg,
                                  haveRadius: false,
                                  width: 55,
                                  height: 55,
                                  borderColor: MyColors.white,
                                  boxShape: BoxShape.circle,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      MyText(
                                        title: commentModel[index].ownerName,
                                        size: 9,
                                      ),
                                      RatingBar.builder(
                                        itemCount: 5,
                                        allowHalfRating: true,
                                        ignoreGestures: true,
                                        onRatingUpdate: (double val) {},
                                        unratedColor: MyColors.white,
                                        itemSize: 12,
                                        itemPadding: const EdgeInsets.symmetric(
                                            vertical: 7),
                                        initialRating:
                                            commentModel[index].rate.toDouble(),
                                        itemBuilder: (_, index) {
                                          return Icon(
                                            Icons.star,
                                            color: MyColors.primary,
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              MyText(
                                title: commentModel[index].date,
                                size: 10,
                                color: MyColors.grey,
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: MyText(
                                    title: commentModel[index].text,
                                    size: 9,
                                    color: MyColors.grey,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () => AutoRouter.of(context).push(
                                  ImageZoomRoute(
                                    images: [commentModel[index].ownerImg],
                                  ),
                                ),
                                child: CachedImage(
                                  url: commentModel[index].commentImg,
                                  haveRadius: false,
                                  borderColor: MyColors.greyWhite,
                                  height: 70,
                                  width: 70,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
                replacement: Center(
                  child: MyText(
                    title: "لا يوجد تعليقات",
                    size: 13,
                    color: MyColors.white,
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
