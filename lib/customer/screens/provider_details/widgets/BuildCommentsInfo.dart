part of 'ProviderDetailsWidgetsImports.dart';

class BuildCommentsInfo extends StatelessWidget {
  final ProviderDetailsData providerDetailsData;
  final List<CommentModel>? commentModel;
  final String kayanId;

  const BuildCommentsInfo(
      {required this.providerDetailsData,
      required this.commentModel,
      required this.kayanId});

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
              child: Visibility(
                visible: commentModel!.length>0,
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
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      MyText(
                                        title: commentModel![index].ownerName,
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
                                ),
                              ),
                              MyText(
                                title: commentModel![index].date,
                                size: 10,
                                color: MyColors.grey,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              PopupMenuButton(
                                color: Colors.white,
                                elevation: 20,
                                icon: Icon(
                                  Icons.more_vert_outlined,
                                  color: MyColors.grey,
                                ),
                                enabled: true,
                                onSelected: (int value) {
                                  if (value == 0) {
                                    buildEditComment(
                                        context, commentModel![index].commentId);
                                  } else if (value == 1) {
                                    buildReportComment(
                                        context, commentModel![index].commentId);
                                  } else {
                                    providerDetailsData.deleteComment(context,
                                        commentModel![index].commentId, kayanId);
                                  }
                                },
                                itemBuilder: (context) => [
                                  PopupMenuItem(
                                    child: MyText(
                                      title: "تعديل",
                                      color: MyColors.black,
                                    ),
                                    value: 0,
                                  ),
                                  PopupMenuItem(
                                    child: MyText(
                                      title: "ابلاغ",
                                      color: MyColors.black,
                                    ),
                                    value: 1,
                                  ),
                                  PopupMenuItem(
                                    child: MyText(
                                      title: "حذف",
                                      color: MyColors.black,
                                    ),
                                    value: 2,
                                  ),
                                ],
                              )
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
                                    images: [commentModel![index].ownerImg],
                                  ),
                                ),
                                child: CachedImage(
                                  url: commentModel![index].commentImg,
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
                    color: MyColors.primary,
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  void buildReportComment(BuildContext context, int commentId) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyText(
                title: "ابلاغ عن تعليق",
                color: MyColors.primary,
                size: 14,
              ),
              SizedBox(
                height: 15,
              ),
              RichTextFiled(
                hint: "الرسالة",
                max: 3,
                fillColor: MyColors.greyWhite,
                controller: providerDetailsData.report,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                action: TextInputAction.done,
                validate: (value) => value!.validateEmpty(context),
              ),
              LoadingButton(
                btnKey: providerDetailsData.btnKey,
                title: "ابلاغ",
                color: MyColors.primary,
                onTap: () => providerDetailsData.reportComment(
                    context, commentId, kayanId),
              ),
            ],
          ),
        );
      },
    );
  }

  void buildEditComment(BuildContext context, int commentId) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyText(
                title: "تعديل التعليق",
                color: MyColors.primary,
                size: 14,
              ),
              SizedBox(
                height: 15,
              ),
              RichTextFiled(
                hint: "الرسالة",
                max: 3,
                fillColor: MyColors.greyWhite,
                controller: providerDetailsData.newComment,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                action: TextInputAction.done,
                validate: (value) => value!.validateEmpty(context),
              ),
              LoadingButton(
                btnKey: providerDetailsData.btnKey,
                title: "ابلاغ",
                color: MyColors.primary,
                onTap: () =>
                    providerDetailsData.editComment(context, commentId,kayanId),
              ),
            ],
          ),
        );
      },
    );
  }
}
