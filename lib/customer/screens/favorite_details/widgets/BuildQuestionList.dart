part of 'FavoriteDetailsWidgetsImports.dart';

class BuildQuestionList extends StatelessWidget {
  final FavoriteDetailsData favoriteDetailsData;
  final bool isShow;

  const BuildQuestionList(
      {required this.favoriteDetailsData, required this.isShow});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<List<QuestionModel>>,
        GenericState<List<QuestionModel>>>(
      bloc: favoriteDetailsData.allQuestionCubit,
      builder: (_, state) {
        return ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          itemCount: state.data.length,
          itemBuilder: (_, index) {
            return BuildQuestionItem(
              index: index,
              isShow: isShow,
              questionModel: state.data[index],
              title: state.data[index].questionName,
              favoriteDetailsData: favoriteDetailsData,
            );
          },
        );
      },
    );
  }
}
