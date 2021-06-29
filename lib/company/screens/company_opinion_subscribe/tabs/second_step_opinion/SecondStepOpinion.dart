part of 'SecondStepOpinionImports.dart';

class SecondStepOpinion extends StatefulWidget {
  final CompOpinionSubscribeData compOpinionSubscribeData;

  const SecondStepOpinion({required this.compOpinionSubscribeData});

  @override
  _SecondStepOpinionState createState() => _SecondStepOpinionState();
}

class _SecondStepOpinionState extends State<SecondStepOpinion> {
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
            step2: true,
          ),
          BuildSecOpinionForm(
              compOpinionSubscribeData: widget.compOpinionSubscribeData),
          BuildOpinionPrice(
              compOpinionSubscribeData: widget.compOpinionSubscribeData),
          DefaultButton(
            color: MyColors.primary,
            textColor: MyColors.blackOpacity,
            borderRadius: BorderRadius.circular(30),
            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            title: "التالي",
            onTap: () => widget.compOpinionSubscribeData.moveNext(),
          ),
          DefaultButton(
            color: MyColors.white,
            textColor: MyColors.primary,
            borderRadius: BorderRadius.circular(30),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            title: "السابق",
            onTap: () => widget.compOpinionSubscribeData.moveBack(),
          )
        ],
      ),
    );
  }
}
