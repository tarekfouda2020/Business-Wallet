part of 'SecStepSpecialWidgetsImports.dart';

class BuildReviewDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        children: [
          Row(
            children: [
              BuildReviewItem(
                title: "تاريخ البداية",
                desc: "fdfdf",
              ),
              BuildReviewItem(
                title: "مدة الترقية",
                desc: "fdfdf",
              ),
            ],
          ),
          Row(
            children: [
              BuildReviewItem(
                title: "المنطقة",
                desc: "fddf",
              ),
              BuildReviewItem(
                title: "الاشخاص المهتمين ب",
                desc: "fddf",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
