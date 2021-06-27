part of 'CompProductAdsWidgetsImports.dart';

class BuildProductQuestions extends StatelessWidget {
  final bool isShow;
  final CompProductAdsData compProductAdsData;

  const BuildProductQuestions(
      {required this.isShow, required this.compProductAdsData});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<List<QuestionModel>>,
        GenericState<List<QuestionModel>>>(
      bloc: compProductAdsData.allQuestionCubit,
      builder: (_, state) {
        return ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          itemCount: state.data.length,
          itemBuilder: (_, index) {
            return BuildProductQuesItem(
              index: index,
              isShow: isShow,
              questionModel: state.data[index],
              title: state.data[index].questionName,
              compProductAdsData: compProductAdsData,
            );
          },
        );
      },
    );
  }
}
