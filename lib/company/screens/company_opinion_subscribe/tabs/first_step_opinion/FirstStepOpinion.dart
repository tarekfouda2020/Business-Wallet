part of 'FirstStepOpinionImports.dart';

class FirstStepOpinion extends StatefulWidget {
  final CompOpinionSubscribeData compOpinionSubscribeData;

  const FirstStepOpinion({required this.compOpinionSubscribeData});

  @override
  _FirstStepOpinionState createState() => _FirstStepOpinionState();
}

class _FirstStepOpinionState extends State<FirstStepOpinion> {
  late FirstStepOpinionData firstStepOpinionData ;


  @override
  void initState() {
    firstStepOpinionData = widget.compOpinionSubscribeData.firstStepOpinionData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        title: "باقة استطلاع رأي",
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        children: [
          BuildStepper(
            step1: true,
          ),
          BuildOpinionForm(
              compOpinionSubscribeData: widget.compOpinionSubscribeData),
          BuildOpinionQuestions(
              compOpinionSubscribeData: widget.compOpinionSubscribeData),
          DefaultButton(
            color: MyColors.primary,
            textColor: MyColors.blackOpacity,
            borderRadius: BorderRadius.circular(30),
            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            title: "التالي",
            onTap: () => widget.compOpinionSubscribeData.onSubscribe(context),
          )
        ],
      ),
    );
  }
}
