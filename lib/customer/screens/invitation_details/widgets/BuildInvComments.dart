part of 'InvDetailsWidgetsImports.dart';

class BuildInvComments extends StatelessWidget {
  final InvitationDetailsData invitationDetailsData;
  final List<CommentModel> commentModel;

  const BuildInvComments(
      {required this.invitationDetailsData, required this.commentModel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
      bloc: invitationDetailsData.commentCubit,
      builder: (context, state) {
        return ListView(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          children: [
            BuildTitle(
              title: "التعليقات",
              open: state.data,
              onTap: () =>
                  invitationDetailsData.commentCubit.onUpdateData(!state.data),
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
                              BuildInvPic(
                                image: commentModel[index].ownerImg,
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
                              Visibility(
                                visible: commentModel[index].commentImg=="",
                                replacement: InkWell(
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
                                ),
                                child: Container(),
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
