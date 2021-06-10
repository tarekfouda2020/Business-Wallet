part of 'FavoriteDetailsWidgetsImports.dart';

class BuildQuestionItem extends StatelessWidget {
  final FavoriteDetailsData favoriteDetailsData;
  final String title;
  final QuestionModel questionModel;
  final int index;
  final bool isShow;

  const BuildQuestionItem(
      {required this.favoriteDetailsData,
      required this.title,
      required this.questionModel,
      required this.index,
      required this.isShow});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            title: title,
            size: 12,
            color: MyColors.primary,
          ),
          ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            itemCount: questionModel.answers.length,
            itemBuilder: (_, position) {
              return BuildAnswerItem(
                title: questionModel.answers[position].nameAr,
                value: questionModel.answers[position].id,
                selected: questionModel.currentAnswer,
                onChange: (value) => favoriteDetailsData.onChangeAnswer(
                    context, index, int.parse("$value"), isShow),
              );
            },
          )
        ],
      ),
    );
  }
}
