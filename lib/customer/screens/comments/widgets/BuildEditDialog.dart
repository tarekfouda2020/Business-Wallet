part of 'CommentsWidgetsImports.dart';

class BuildEditDialog extends StatelessWidget {
  final CommentsData commentsData;
  final String kayanId;
  final int commentId;
  final int index;

  const BuildEditDialog(
      {required this.commentsData,
      required this.kayanId,
      required this.commentId,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<List<ProfileCommentsModel>>,
        GenericState<List<ProfileCommentsModel>>>(
      bloc: commentsData.commentsCubit,
      builder: (_, state) {
        return Container(
          height: 350,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          child: Column(
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
                hint: state.data[index].comment == ""
                    ? "الرسالة"
                    : state.data[index].comment,
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
                onTap: () =>
                    commentsData.editComment(context, kayanId, commentId),
              ),
            ],
          ),
        );
      },
    );
  }
}
