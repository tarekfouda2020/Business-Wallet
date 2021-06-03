part of 'ProviderDetailsWidgetsImports.dart';

class BuildCommentsInfo extends StatelessWidget {
  final ProviderDetailsData providerDetailsData;
  final List<CommentModel>? commentModel;

  const BuildCommentsInfo(
      {required this.providerDetailsData, required this.commentModel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
      bloc: providerDetailsData.commentsCubit,
      builder: (context, state) {
        return Column(
          children: [
            BuildTitle(
              title: "التعليقات",
              open: state.data,
              onTap: () =>
                  providerDetailsData.commentsCubit.onUpdateData(!state.data),
            ),
            Visibility(
              visible: state.data,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: commentModel!.length,
                itemBuilder: (_, index) {
                  return Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: MyColors.greyWhite)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CachedImage(
                              url: commentModel![index].ownerImg,
                              haveRadius: false,
                              width: 50,
                              height: 50,
                              boxShape: BoxShape.circle,
                            ),
                            Expanded(
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: MyText(
                                  title: commentModel![index].ownerName,
                                  size: 9,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                MyText(
                                  title: commentModel![index].date,
                                  size: 8,
                                  color: MyColors.grey,
                                ),
                                RatingBar.builder(
                                  itemCount: 5,
                                  allowHalfRating: true,
                                  ignoreGestures: true,
                                  onRatingUpdate: (double val) {},
                                  unratedColor: MyColors.white,
                                  itemSize: 12,
                                  itemPadding:
                                      const EdgeInsets.symmetric(vertical: 7),
                                  initialRating:
                                      commentModel![index].rate.toDouble(),
                                  itemBuilder: (_, index) {
                                    return Icon(
                                      Icons.star,
                                      color: MyColors.primary,
                                    );
                                  },
                                ),
                              ],
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
                                  title: commentModel![index].text,
                                  size: 9,
                                  color: MyColors.grey,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () => AutoRouter.of(context).push(
                                  ImageZoomRoute(
                                      images: [commentModel![index].ownerImg])),
                              child: CachedImage(
                                url: commentModel![index].ownerImg,
                                haveRadius: false,
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
            )
          ],
        );
      },
    );
  }
}
