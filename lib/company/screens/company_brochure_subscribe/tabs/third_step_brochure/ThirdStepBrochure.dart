part of 'ThirdStepBrochureImports.dart';

class ThirdStepBrochure extends StatefulWidget {
  final CompBrochureSubscribeData compBrochureSubscribeData;

  const ThirdStepBrochure({required this.compBrochureSubscribeData});

  @override
  _ThirdStepBrochureState createState() => _ThirdStepBrochureState();
}

class _ThirdStepBrochureState extends State<ThirdStepBrochure> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        title: "باقة بروشور",
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        children: [
          BuildStepper(
            step3: true,
          ),
          BuildReviewPrice(
            compBrochureSubscribeData: widget.compBrochureSubscribeData,
          ),
          DefaultButton(
            color: MyColors.primary,
            textColor: MyColors.blackOpacity,
            borderRadius: BorderRadius.circular(30),
            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            title: "التالي",
            onTap: () => Navigator.of(context).pop(),
          )
        ],
      ),
    );
  }
}
