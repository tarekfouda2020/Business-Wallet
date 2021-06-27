part of 'ThirdStepOpinionImports.dart';

class ThirdStepOpinion extends StatefulWidget {
  final GenericCubit subscribeCubit;
  final Function(int page) movePage;

  const ThirdStepOpinion(
      {required this.subscribeCubit, required this.movePage});

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
            step1: true,
            step2: true,
            step3: true,
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
