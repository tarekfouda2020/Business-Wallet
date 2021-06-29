part of 'SecondStepBrochureImports.dart';

class SecondStepBrochure extends StatefulWidget {
  final CompBrochureSubscribeData compBrochureSubscribeData;

  const SecondStepBrochure({required this.compBrochureSubscribeData});

  @override
  _SecondStepBrochureState createState() => _SecondStepBrochureState();
}

class _SecondStepBrochureState extends State<SecondStepBrochure> {
  final SecondStepBrochureData secondStepBrochureData =
      new SecondStepBrochureData();

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
            step2: true,
          ),
          BuildBranch(
            compBrochureSubscribeData: widget.compBrochureSubscribeData,
          ),
          BuildForm(
            compBrochureSubscribeData: widget.compBrochureSubscribeData,
          ),
          BuildViewPrice(
            compBrochureSubscribeData: widget.compBrochureSubscribeData,
          ),
          DefaultButton(
            color: MyColors.primary,
            textColor: MyColors.blackOpacity,
            borderRadius: BorderRadius.circular(30),
            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            title: "التالي",
            onTap: () => widget.compBrochureSubscribeData.navigateToThird(
                context),
          )
        ],
      ),
    );
  }
}
