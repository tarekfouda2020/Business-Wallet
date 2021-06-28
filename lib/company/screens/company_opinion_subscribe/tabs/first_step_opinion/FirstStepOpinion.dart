part of 'FirstStepOpinionImports.dart';

class FirstStepOpinion extends StatefulWidget {
  final GenericCubit subscribeCubit;
  final Function(int page) movePage;

  const FirstStepOpinion(
      {required this.subscribeCubit, required this.movePage});

  @override
  _FirstStepOpinionState createState() => _FirstStepOpinionState();
}

class _FirstStepOpinionState extends State<FirstStepOpinion> {
  final FirstStepOpinionData firstStepOpinionData= new FirstStepOpinionData();
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

          DefaultButton(
            color: MyColors.primary,
            textColor: MyColors.blackOpacity,
            borderRadius: BorderRadius.circular(30),
            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            title: "التالي",
            onTap: () => widget.movePage(1),
          )
        ],
      ),
    );
  }
}
