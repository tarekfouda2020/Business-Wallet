part of 'FirstStepBrochureImports.dart';

class FirstStepBrochure extends StatefulWidget {
  final GenericCubit subscribeCubit;
  final Function(int page) movePage;

  const FirstStepBrochure(
      {required this.subscribeCubit, required this.movePage});

  @override
  _FirstStepBrochureState createState() => _FirstStepBrochureState();
}

class _FirstStepBrochureState extends State<FirstStepBrochure> {
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
            movePage: widget.movePage,
          ),
          BuildContact(),
          BuildDesc(
            desc: "ddd",
          ),
          BuildServices(),
          BuildProducts(),
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
