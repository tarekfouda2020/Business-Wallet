part of 'FirstStepOpinionWidgetsImport.dart';

class BuildOpinionQuestions extends StatelessWidget {
  final CompOpinionSubscribeData compOpinionSubscribeData;

  const BuildOpinionQuestions({required this.compOpinionSubscribeData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                title: "اضافة سؤال ",
                size: 11,
                color: MyColors.white,
              ),
              IconButton(
                icon: Icon(
                  MdiIcons.plusCircle,
                  color: MyColors.primary,
                  size: 35,
                ),
                onPressed: compOpinionSubscribeData.addQuestion,
              ),
            ],
          ),
        ),
        BlocBuilder<GenericCubit<List<AddOpinionQuestionsModel>>,
            GenericState<List<AddOpinionQuestionsModel>>>(
          bloc: compOpinionSubscribeData.addOpinionQuestionCubit,
          builder: (_, state) {
            return Column(
              children: List.generate(
                state.data.length,
                (index) {
                  return BuildQuestionItem(
                    compOpinionSubscribeData: compOpinionSubscribeData,
                    index: index,
                    model: state.data[index],
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
