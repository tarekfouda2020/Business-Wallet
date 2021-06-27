part of 'SecondStepSpecialImports.dart';

class SecondStepSpecial extends StatefulWidget {
  final GenericCubit subscribeCubit;
  final Function(int page) movePage;

  const SecondStepSpecial(
      {required this.subscribeCubit, required this.movePage});

  @override
  _SecondStepSpecialState createState() => _SecondStepSpecialState();
}

class _SecondStepSpecialState extends State<SecondStepSpecial> {
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
            step2: true,
            movePage: widget.movePage,
          ),
          BuildReviewPrice(),
          BuildReviewDetails(),
          DefaultButton(
            color: MyColors.primary,
            textColor: MyColors.blackOpacity,
            borderRadius: BorderRadius.circular(30),
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 70),
            title: "حفظ كملف",
            onTap: () {},
          ),
          DefaultButton(
            color: MyColors.primary,
            textColor: MyColors.blackOpacity,
            borderRadius: BorderRadius.circular(30),
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            title: "التالي",
            onTap: () => widget.movePage(2),
          )
        ],
      ),
    );
  }
}
