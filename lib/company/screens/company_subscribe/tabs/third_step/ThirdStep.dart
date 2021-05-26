part of 'ThirdStepImports.dart';

class ThirdStep extends StatefulWidget {
  final GenericCubit subscribeCubit;
  final Function(int page) movePage;

  ThirdStep({required this.subscribeCubit, required this.movePage});

  @override
  _ThirdStepState createState() => _ThirdStepState();
}

class _ThirdStepState extends State<ThirdStep> {
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
            step3: true,
            movePage: widget.movePage,
          ),
          BuildReviewPrice(),
         BuildDetails(),

          DefaultButton(
            color: MyColors.primary,
            textColor: MyColors.blackOpacity,
            borderRadius: BorderRadius.circular(30),
            title: "التالي",
            onTap: () => widget.movePage(3),
          )
        ],
      ),
    );
  }
}
