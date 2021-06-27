part of 'ThirdStepBrochureWidgetsImports.dart';

class BuildReviewPrice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          MyText(
            title: "التكلفة الاجمالية",
            size: 15,
            color: MyColors.white,
          ),
          MyText(
            title: "التكلفة تشمل قيمة الضريبة المضافة و 15% تكاليف التشغيل",
            size: 12,
            color: MyColors.white,
          ),
          MyText(
            title: "500 ر.س",
            size: 16,
            color: MyColors.primary,
          ),
        ],
      ),
    );
  }
}
