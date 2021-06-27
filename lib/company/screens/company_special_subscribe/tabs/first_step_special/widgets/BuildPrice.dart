part of 'FisrtStepSpecialWidgetImports.dart';

class BuildPrice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyText(
          title: "التكلفة",
          color: MyColors.primary,
          size: 12,
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
            border: Border.all(color: MyColors.primary),
            borderRadius: BorderRadius.circular(5),
          ),
          child: MyText(
            title: "0.0 ريال سعودي",
            size: 12,
            color: MyColors.white,
          ),
        ),
      ],
    );
  }
}
