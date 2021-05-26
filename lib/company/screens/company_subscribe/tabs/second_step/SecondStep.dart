part of 'SecondStepImports.dart';

class SecondStep extends StatefulWidget {
  final GenericCubit subscribeCubit;
  final Function(int page) movePage;

  SecondStep({required this.subscribeCubit, required this.movePage});

  @override
  _SecondStepState createState() => _SecondStepState();
}

class _SecondStepState extends State<SecondStep> {
  final SecondStepData secondStepData = new SecondStepData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        title: "اعلان مرسل لفئة محدودة من العملاء",
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        children: [
          BuildStepper(
            step2: true,
            movePage: widget.movePage,
          ),
          BuildSecForm(secondStepData: secondStepData),
          BuildPrice(),
          BuildAdsValue(secondStepData: secondStepData),
          DefaultButton(
            color: MyColors.primary,
            textColor: MyColors.blackOpacity,
            borderRadius: BorderRadius.circular(30),
            title: "التالي",
            onTap: () => widget.movePage(2),
          )
        ],
      ),
    );
  }
}
