part of 'FirstStepOpinionWidgetsImport.dart';

class BuildQuestionItem extends StatelessWidget {
  final CompOpinionSubscribeData compOpinionSubscribeData;
  final int index;
  final AddOpinionQuestionsModel model;

  const BuildQuestionItem(
      {required this.compOpinionSubscribeData,
      required this.index,
      required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      margin: const EdgeInsets.symmetric(vertical: 7),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: MyColors.greyWhite)),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: LabelTextField(
                  hint: "السؤال",
                  controller: compOpinionSubscribeData.msg,
                  action: TextInputAction.next,
                  type: TextInputType.emailAddress,
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  validate: (value) => value!.validateEmpty(context),
                ),
              ),
              IconButton(
                icon: Icon(
                  MdiIcons.closeCircle,
                  color: MyColors.primary,
                  size: 35,
                ),
                onPressed: () => compOpinionSubscribeData.removeQuestion(index),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(
                  title: "اضافة اجابة ",
                  size: 11,
                  color: MyColors.white,
                ),
                IconButton(
                  icon: Icon(
                    MdiIcons.plusCircle,
                    color: MyColors.primary,
                    size: 35,
                  ),
                  onPressed: () => compOpinionSubscribeData.addAnswer(index),
                ),
              ],
            ),
          ),
          Column(
            children: List.generate(
              model.answersNameController.length,
              (answerIndex) {
                return BuildAnswerItem(
                  compOpinionSubscribeData: compOpinionSubscribeData,
                  index: index,
                  position: answerIndex,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
