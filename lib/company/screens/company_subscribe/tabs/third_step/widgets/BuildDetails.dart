part of 'ThirdStepWidgetsImports.dart';

class BuildDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      child: Column(

        children: [
          Row(
            children: [
              BuildReviewItem(
                title: "اسم الاعلان",
                desc: "fdfdf",
              ),
              BuildReviewItem(
                title: "وصف الاعلان",
                desc: "fdfdf",
              ),
            ],
          ),
          Row(
            children: [
              BuildReviewItem(
                title: "عدد المشاهدات",
                desc: "fddf",
              ),
              BuildReviewItem(
                title: "وقت مشاهدة الاعلان",
                desc: "fddf",
              ),
            ],
          ),
          Row(
            children: [
              BuildReviewItem(
                title: "تاريخ بداية الاعلان",
                desc: "fddf",
              ),
              BuildReviewItem(
                title: "المدينة",
                desc: "fddf",
              ),
            ],
          ),
          Row(
            children: [
              BuildReviewItem(
                title: "الجنس",
                desc: "fddf",
              ),
              BuildReviewItem(
                title: "نوع السكن",
                desc: "fddf",
              ),
            ],
          ),
          Row(
            children: [
              BuildReviewItem(
                title: "مستوي التعليم",
                desc: "fddf",
              ),
              BuildReviewItem(
                title: "عدد افراد الاسرة",
                desc: "fddf",
              ),
            ],
          ),
          Row(
            children: [
              BuildReviewItem(
                title: "متوسط الدخل في السنة",
                desc: "fddf",
              ),
              BuildReviewItem(
                title: "الاشخاص مهتمين ب",
                desc: "fddf",
              ),
            ],
          ),
          BuildImages(),
          BuildFiles(),
        ],
      ),
    );
  }
}
