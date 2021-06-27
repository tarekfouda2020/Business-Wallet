part of 'FirstStepSpecialImports.dart';

class FirstStepSpecial extends StatefulWidget {
  final GenericCubit subscribeCubit;
  final Function(int page) movePage;

  const FirstStepSpecial(
      {required this.subscribeCubit, required this.movePage});

  @override
  _FirstStepSpecialState createState() => _FirstStepSpecialState();
}

class _FirstStepSpecialState extends State<FirstStepSpecial> {
  final FirstStepSpecialData firstStepSpecialData= new FirstStepSpecialData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        title: "باقة تميز",
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        children: [
          BuildStepper(
            step1: true,
            movePage: widget.movePage,
          ),
          BuildForm(firstStepSpecialData: firstStepSpecialData,),
          BuildPrice(),
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
