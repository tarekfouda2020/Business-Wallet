part of 'ThirdStepOpinionImports.dart';

class ThirdStepOpinion extends StatefulWidget {
  final CompOpinionSubscribeData compOpinionSubscribeData;

  const ThirdStepOpinion({required this.compOpinionSubscribeData});

  @override
  _ThirdStepOpinionState createState() => _ThirdStepOpinionState();
}

class _ThirdStepOpinionState extends State<ThirdStepOpinion> {
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
            step3: true,
          ),
          BuildPriceView(
              compOpinionSubscribeData: widget.compOpinionSubscribeData),
          BuildDetailsView(
              compOpinionSubscribeData: widget.compOpinionSubscribeData),
          BuildButtonList(
              compOpinionSubscribeData: widget.compOpinionSubscribeData)
        ],
      ),
    );
  }
}
