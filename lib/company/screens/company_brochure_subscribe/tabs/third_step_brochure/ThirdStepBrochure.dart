part of 'ThirdStepBrochureImports.dart';

class ThirdStepBrochure extends StatefulWidget {
  final GenericCubit subscribeCubit;
  final Function(int page) movePage;

  const ThirdStepBrochure(
      {required this.subscribeCubit, required this.movePage});

  @override
  _ThirdStepBrochureState createState() => _ThirdStepBrochureState();
}

class _ThirdStepBrochureState extends State<ThirdStepBrochure> {
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
            step3: true,
            movePage: widget.movePage,
          ),
          BuildReviewPrice(),
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
