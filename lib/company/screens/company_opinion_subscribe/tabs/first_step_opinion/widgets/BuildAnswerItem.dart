part of 'FirstStepOpinionWidgetsImport.dart';

class BuildAnswerItem extends StatelessWidget {
  final CompOpinionSubscribeData compOpinionSubscribeData;
  final int index;
  final int position;

  const BuildAnswerItem(
      {required this.compOpinionSubscribeData,
      required this.index,
      required this.position});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 3,
          child: LabelTextField(
            hint: "الاجابة",
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
          onPressed: ()=> compOpinionSubscribeData.removeAnswer(index,position),
        ),
      ],
    );
  }
}
