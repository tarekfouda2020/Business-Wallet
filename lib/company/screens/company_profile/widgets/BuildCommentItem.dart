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
                  Row(
                    children: [
                      Expanded(
                        child: MyText(
                          title: commentModel.ownerName!,
                          size: 9,
                          color: MyColors.greyWhite.withOpacity(.9),
                        ),
                      ),
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
                      SizedBox(
                        width: 30,
                      ),
                      MyText(
                        title: commentModel.date!.toString(),
                        size: 9,
                        color: MyColors.greyWhite.withOpacity(.9),
                      ),
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
                      )
                    ],
                  ),
                  MyText(
                    title: commentModel.text!,
                    size: 9,
                    color: MyColors.greyWhite.withOpacity(.9),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
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
                controller: companyProfileData.report,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                action: TextInputAction.done,
                validate: (value) => value!.validateEmpty(context),
              ),
              LoadingButton(
                btnKey: companyProfileData.btnKey,
                title: "ابلاغ",
                color: MyColors.primary,
                onTap: () => companyProfileData.reportComment(
                    context, commentId, commentModel.fkOwnerComment!),
              ),
            ],
          ),
        );
      },
    );
  }
}
