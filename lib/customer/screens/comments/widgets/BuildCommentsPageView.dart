part of 'CommentsWidgetsImports.dart';

class BuildCommentsPageView extends StatelessWidget {
  final ProfileCommentsModel comments;
  final CommentsData commentsData;
final int index;
  const BuildCommentsPageView(
      {required this.comments, required this.commentsData,required this.index});

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
                    commentsData.showEditDialog(context, commentsData,
                        comments.kayanId, comments.commentId,index);
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
              Visibility(
                visible: comments.commentImg == "",
                replacement: InkWell(
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
                ),
                child: Container(),
              )
            ],
          ),
        ],
      ),
    );
  }
}
