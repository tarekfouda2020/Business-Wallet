part of 'DetailsWidgetsImports.dart';

class BuildCommentsDrop extends StatelessWidget {
  final CompanyMainDetailsData companyMainDetailsData;
  final List<CommentModel>? commentModel;
  final String kayanId;

  BuildCommentsDrop(
      {required this.companyMainDetailsData,
      required this.commentModel,
      required this.kayanId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
      bloc: companyMainDetailsData.commentsDropCubit,
      builder: (_, state) {
        return Column(
          children: [
            BuildDropItem(
              title: "التعليقات",
              genericCubit: companyMainDetailsData.commentsDropCubit,
            ),
            Visibility(
              visible: state.data,
              child: Container(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: commentModel!.length,
                  itemBuilder: (_, index) => BuildCommentItem(
                    commentModel: commentModel![index],
                    companyMainDetailsData: companyMainDetailsData,
                    kayanId: kayanId,
                  ),
                ),
              ),
              replacement: Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
              ),
            ),
          ],
        );
      },
    );
  }
}
