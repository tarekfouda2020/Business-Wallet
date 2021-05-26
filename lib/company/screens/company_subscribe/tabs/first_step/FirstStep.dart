part of 'FirstStepImports.dart';

class FirstStep extends StatefulWidget {
  final GenericCubit subscribeCubit;
  final Function(int page) movePage;

  FirstStep({required this.subscribeCubit, required this.movePage});

  @override
  _FirstStepState createState() => _FirstStepState();
}

class _FirstStepState extends State<FirstStep> {
  final FirstStepData firstStepData = new FirstStepData();

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
          BuildStepper(step1: true),
          BuildHelp(),
          BuildForm(firstStepData: firstStepData),
          BuildAddFile(),
          BuildAddImage(),
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
