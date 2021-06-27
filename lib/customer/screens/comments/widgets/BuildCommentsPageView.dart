part of 'CommentsWidgetsImports.dart';

class BuildCommentsPageView extends StatelessWidget {
  final ProfileCommentsModel comments;
  final CommentsData commentsData;

  const BuildCommentsPageView(
      {required this.comments, required this.commentsData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: MyColors.greyWhite,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedImage(
                url: comments.Img,
                haveRadius: false,
                width: 60,
                height: 60,
                borderColor: MyColors.greyWhite,
                boxShape: BoxShape.circle,
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        title: comments.kayanName,
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
                        initialRating: comments.rate.toDouble(),
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
                    buildEditComment(context, comments.commentId);
                  } else {
                    commentsData.deleteComment(context, comments.commentId);
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
                      title: "حذف",
                      color: MyColors.black,
                    ),
                    value: 1,
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
                    title: comments.comment,
                    size: 9,
                    color: MyColors.grey,
                  ),
                ),
              ),
              InkWell(
                onTap: () => AutoRouter.of(context).push(
                  ImageZoomRoute(
                    images: [comments.commentImg],
                  ),
                ),
                child: CachedImage(
                  url: comments.commentImg,
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
              BlocBuilder<GenericCubit<int>, GenericState<int>>(
                bloc: commentsData.rateCubit,
                builder: (context, state) {
                  return Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(vertical: 15),
                    child: RatingBar.builder(
                      initialRating: state.data.toDouble(),
                      minRating: 0,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      updateOnDrag: false,
                      itemCount: 5,
                      itemSize: 25,
                      itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) =>
                          commentsData.rateCubit.onUpdateData(rating.toInt()),
                    ),
                  );
                },
              ),
              RichTextFiled(
                hint: "الرسالة",
                max: 3,
                fillColor: MyColors.greyWhite,
                controller: commentsData.newComment,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                action: TextInputAction.done,
                validate: (value) => value!.validateEmpty(context),
              ),
              LoadingButton(
                btnKey: commentsData.btnKey,
                title: "ابلاغ",
                color: MyColors.primary,
                onTap: () => commentsData.editComment(
                    context, comments.kayanId, commentId),
              ),
            ],
          ),
        );
      },
    );
  }
}
