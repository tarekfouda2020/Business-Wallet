part of 'DetailsWidgetsImports.dart';

class BuildCommentItem extends StatelessWidget {
  final CommentModel? commentModel;
  final CompanyMainDetailsData companyMainDetailsData;
  final String kayanId;

  const BuildCommentItem(
      {required this.commentModel,
      required this.companyMainDetailsData,
      required this.kayanId});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: MyColors.greyWhite),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CachedImage(
                url: commentModel!.ownerImg,
                haveRadius: false,
                width: 50,
                height: 50,
                boxShape: BoxShape.circle,
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        title: commentModel!.ownerName,
                        size: 9,
                      ),
                      RatingBar.builder(
                        itemCount: 5,
                        allowHalfRating: true,
                        ignoreGestures: true,
                        onRatingUpdate: (double val) {},
                        unratedColor: MyColors.white,
                        itemSize: 12,
                        itemPadding: const EdgeInsets.symmetric(vertical: 7),
                        initialRating: commentModel!.rate.toDouble(),
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
                title: commentModel!.date,
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
                  color: MyColors.white,
                ),
                enabled: true,
                onSelected: (int value) {
                  if (value == 0) {
                    companyMainDetailsData.newComment.text = commentModel!.text;
                    buildEditComment(context, commentModel!.commentId);
                  } else if (value == 1) {
                    buildReportComment(context, commentModel!.commentId);
                  } else {
                    companyMainDetailsData.deleteComment(
                        context, commentModel!.commentId, kayanId);
                  }
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: MyText(
                      title: "??????????",
                      color: MyColors.black,
                    ),
                    value: 0,
                  ),
                  PopupMenuItem(
                    child: MyText(
                      title: "??????????",
                      color: MyColors.black,
                    ),
                    value: 1,
                  ),
                  PopupMenuItem(
                    child: MyText(
                      title: "??????",
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
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: MyText(
                    title: commentModel!.text,
                    size: 9,
                    color: MyColors.grey,
                  ),
                ),
              ),
              InkWell(
                onTap: () => AutoRouter.of(context).push(
                  ImageZoomRoute(
                    images: [commentModel!.ownerImg],
                  ),
                ),
                child: CachedImage(
                  url: commentModel!.commentImg,
                  borderRadius: BorderRadius.circular(5),
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
  }

  void buildReportComment(BuildContext context, int commentId) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: MyText(
                title: "?????????? ???? ??????????",
                color: MyColors.primary,
                size: 14,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25),
                ),
              ),
              content: Form(
                key: companyMainDetailsData.formKey,
                child: RichTextFiled(
                  hint: "??????????????",
                  max: 3,
                  fillColor: MyColors.greyWhite,
                  controller: companyMainDetailsData.report,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  action: TextInputAction.done,
                  validate: (value) => value!.validateEmpty(context),
                ),
              ),
              actions: [
                LoadingButton(
                  btnKey: companyMainDetailsData.btnKey,
                  title: "??????????",
                  color: MyColors.primary,
                  onTap: () => companyMainDetailsData.reportComment(
                      context, commentId, kayanId),
                ),
              ],
            ));
    // showModalBottomSheet(
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.vertical(
    //       top: Radius.circular(25),
    //     ),
    //   ),
    //   context: context,
    //   builder: (BuildContext context) {
    //     return Container(
    //       padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
    //       child: Column(
    //         mainAxisSize: MainAxisSize.min,
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: [
    //           MyText(
    //             title: "?????????? ???? ??????????",
    //             color: MyColors.primary,
    //             size: 14,
    //           ),
    //           SizedBox(
    //             height: 15,
    //           ),
    //           RichTextFiled(
    //             hint: "??????????????",
    //             max: 3,
    //             fillColor: MyColors.greyWhite,
    //             controller: companyMainDetailsData.report,
    //             margin: const EdgeInsets.symmetric(horizontal: 16),
    //             action: TextInputAction.done,
    //             validate: (value) => value!.validateEmpty(context),
    //           ),
    //           LoadingButton(
    //             btnKey: companyMainDetailsData.btnKey,
    //             title: "??????????",
    //             color: MyColors.primary,
    //             onTap: () => companyMainDetailsData.reportComment(
    //                 context, commentId, kayanId),
    //           ),
    //         ],
    //       ),
    //     );
    //   },
    // );
  }

  void buildEditComment(BuildContext context, int commentId) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: MyText(
                title: "?????????? ??????????????",
                color: MyColors.primary,
                size: 14,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25),
                ),
              ),
              content: Form(
                key: companyMainDetailsData.formKey,
                child: RichTextFiled(
                  hint: "??????????????",
                  max: 3,
                  fillColor: MyColors.greyWhite,
                  controller: companyMainDetailsData.newComment,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  action: TextInputAction.done,
                  validate: (value) => value!.validateEmpty(context),
                ),
              ),
              actions: [
                LoadingButton(
                  btnKey: companyMainDetailsData.btnKey,
                  title: "??????????",
                  color: MyColors.primary,
                  onTap: () => companyMainDetailsData.editComment(
                      context, commentId, kayanId),
                ),
              ],
            ));
    // showModalBottomSheet(
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.vertical(
    //       top: Radius.circular(25),
    //     ),
    //   ),
    //   context: context,
    //   builder: (BuildContext context) {
    //     return Container(
    //       padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
    //       child: Column(
    //         mainAxisSize: MainAxisSize.min,
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: [
    //           MyText(
    //             title: "?????????? ??????????????",
    //             color: MyColors.primary,
    //             size: 14,
    //           ),
    //           SizedBox(
    //             height: 15,
    //           ),
    //
    //           LoadingButton(
    //             btnKey: companyMainDetailsData.btnKey,
    //             title: "??????????",
    //             color: MyColors.primary,
    //             onTap: () => companyMainDetailsData.editComment(
    //                 context, commentId, kayanId),
    //           ),
    //         ],
    //       ),
    //     );
    //   },
    // );
  }
}
