part of 'SecondStepOpinionImports.dart';

class SecondStepOpinion extends StatefulWidget {
  final GenericCubit subscribeCubit;
  final Function(int page) movePage;

  const SecondStepOpinion(
      {required this.subscribeCubit, required this.movePage});

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
            step1: true,
            step2: true,
            movePage: widget.movePage,
          ),
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
