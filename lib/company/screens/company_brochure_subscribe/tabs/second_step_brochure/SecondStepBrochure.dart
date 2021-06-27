part of 'SecondStepBrochureImports.dart';

class SecondStepBrochure extends StatefulWidget {
  final GenericCubit subscribeCubit;
  final Function(int page) movePage;

  const SecondStepBrochure(
      {required this.subscribeCubit, required this.movePage});

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
            step1: true,
            step2: true,
            movePage: widget.movePage,
          ),
          BuildBranch(
            secondStepBrochureData: secondStepBrochureData,
          ),
          BuildForm(
            secondStepBrochureData: secondStepBrochureData,
          ),
          BuildViewPrice(secondStepBrochureData: secondStepBrochureData,),
          DefaultButton(
            color: MyColors.primary,
            textColor: MyColors.blackOpacity,
            borderRadius: BorderRadius.circular(30),
            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            title: "التالي",
            onTap: () => widget.movePage(2),
          )
        ],
      ),
    );
  }
}
