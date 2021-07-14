part of 'CompProfileWidgetsImports.dart';

class BuildCommentItem extends StatelessWidget {
  final CompCommentModel commentModel;
  final CompanyProfileData companyProfileData;

  const BuildCommentItem(
      {required this.commentModel, required this.companyProfileData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 5),
      decoration: BoxDecoration(
        border: Border.all(color: MyColors.greyWhite),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          CachedImage(
            url: commentModel.ownerImg!,
            haveRadius: false,
            boxShape: BoxShape.circle,
            width: 60,
            height: 60,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    title: commentModel.ownerName!,
                    size: 9,
                    color: MyColors.greyWhite.withOpacity(.9),
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
                        initialRating: commentModel.rate!.toDouble(),
                        itemBuilder: (_, index) {
                          return Icon(
                            Icons.star,
                            color: MyColors.primary,
                          );
                        },
                      ),
                      MyText(
                        title: "( ${commentModel.rate!.toDouble()} )",
                        size: 9,
                        color: MyColors.greyWhite.withOpacity(.9),
                      ),
                    ],
                  ),
                  MyText(
                    title: commentModel.text!,
                    size: 9,
                    color: MyColors.greyWhite.withOpacity(.9),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  MyText(
                    title: commentModel.date!.toString(),
                    size: 9,
                    color: MyColors.greyWhite.withOpacity(.9),
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PopupMenuButton(
                color: Colors.white,
                elevation: 20,
                icon: Icon(
                  Icons.info,
                  color: MyColors.grey,
                ),
                enabled: true,
                onSelected: (int value) {
                  buildReportComment(context, commentModel.commentId!);
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: MyText(
                      title: "ابلاغ",
                      color: MyColors.black,
                    ),
                    value: 0,
                  ),
                ],
              ),
              CachedImage(
                url: commentModel.commentImg!,
                haveRadius: false,
                boxShape: BoxShape.circle,
                width: 50,
                height: 50,
              ),
            ],
          )
        ],
      ),
    );
  }

  void buildReportComment(BuildContext context, int commentId) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: MyText(
                title: "ابلاغ عن تعليق",
                color: MyColors.primary,
                size: 14,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25),
                ),
              ),
              content: Form(
                key: companyProfileData.formKey,
                child: RichTextFiled(
                  hint: "الرسالة",
                  max: 3,
                  fillColor: MyColors.greyWhite,
                  controller: companyProfileData.report,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  action: TextInputAction.done,
                  validate: (value) => value!.validateEmpty(context),
                ),
              ),
              actions: [
                LoadingButton(
                  btnKey: companyProfileData.btnKey,
                  title: "ابلاغ",
                  color: MyColors.primary,
                  onTap: () => companyProfileData.reportComment(
                      context, commentId, commentModel.fkOwnerComment!),
                ),
              ],
            ));
    // showModalBottomSheet(
    //   isScrollControlled: true,
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.vertical(
    //       top: Radius.circular(25),
    //     ),
    //   ),
    //   enableDrag: true,
    //   context: context,
    //   builder: (BuildContext context) {
    //     return Container(
    //       padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
    //       child: ListView(
    //         // mainAxisSize: MainAxisSize.min,
    //         // crossAxisAlignment: CrossAxisAlignment.center,
    //         children: [
    //           MyText(
    //             title: "ابلاغ عن تعليق",
    //             color: MyColors.primary,
    //             size: 14,
    //           ),
    //           SizedBox(
    //             height: 15,
    //           ),
    //           Form(
    //             key: companyProfileData.formKey,
    //             child: RichTextFiled(
    //               hint: "الرسالة",
    //               max: 3,
    //               fillColor: MyColors.greyWhite,
    //               controller: companyProfileData.report,
    //               margin: const EdgeInsets.symmetric(horizontal: 16),
    //               action: TextInputAction.done,
    //               validate: (value) => value!.validateEmpty(context),
    //             ),
    //           ),
    //           LoadingButton(
    //             btnKey: companyProfileData.btnKey,
    //             title: "ابلاغ",
    //             color: MyColors.primary,
    //             onTap: () => companyProfileData.reportComment(
    //                 context, commentId, commentModel.fkOwnerComment!),
    //           ),
    //         ],
    //       ),
    //     );
    //   },
    // );
  }
}
