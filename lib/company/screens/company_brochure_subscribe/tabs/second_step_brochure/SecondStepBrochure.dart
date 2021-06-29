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

          BuildForm(
            compBrochureSubscribeData: widget.compBrochureSubscribeData,
          ),
          BuildViewPrice(
            compBrochureSubscribeData: widget.compBrochureSubscribeData,
          ),

          LoadingButton(
            btnKey: widget.compBrochureSubscribeData.btnKey,
            color: MyColors.primary,
            textColor: MyColors.blackOpacity,
            borderRadius: 30,
            margin: const EdgeInsets.symmetric( horizontal: 20),
            title: "التالي",
            onTap: () =>
                widget.compBrochureSubscribeData.navigateToThird(context),
          ),
          DefaultButton(
            color: MyColors.white,
            textColor: MyColors.primary,
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),

            borderRadius: BorderRadius.circular(30),
            title: "السابق",
            onTap: () => widget.compBrochureSubscribeData.moveBack(),
          )
        ],
      ),
    );
  }
}
