part of 'ThirdStepWidgetsImports.dart';
class BuildReviewPrice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyText(
          title: "التكلفة الاجمالية",
          size: 17,
          color: MyColors.white,
        ),
        MyText(
          title: "500 ر.س",
          size: 16,
          color: MyColors.primary,
        ),
      ],
    );
  }
}
