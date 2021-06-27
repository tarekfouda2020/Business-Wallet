part of 'ThirdStepWidgetsImports.dart';

class BuildDetails extends StatelessWidget {
  final CompanySubscribeData companySubscribeData;

  const BuildDetails({required this.companySubscribeData});

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
                desc: companySubscribeData.addSubscribeModel.adsName,
              ),
              BuildReviewItem(
                title: "وصف الاعلان",
                desc: companySubscribeData.addSubscribeModel.adsDesc,
              ),
            ],
          ),
          Row(
            children: [
              BuildReviewItem(
                title: "عدد المشاهدات",
                desc:
                    companySubscribeData.addSubscribeModel.countView.toString(),
              ),
              BuildReviewItem(
                title: "وقت مشاهدة الاعلان",
                desc: companySubscribeData.addSubscribeModel.durationSec
                    .toString(),
              ),
            ],
          ),
          Row(
            children: [
              BuildReviewItem(
                title: "تاريخ بداية الاعلان",
                desc: companySubscribeData.addSubscribeModel.startTime,
              ),
              BuildReviewItem(
                title: "المدينة",
                desc: companySubscribeData.addSubscribeModel.cityName,
              ),
            ],
          ),
          Row(
            children: [
              BuildReviewItem(
                title: "الجنس",
                desc: companySubscribeData.addSubscribeModel.gender=="F"?"انثي":"ذكر",
              ),
              BuildReviewItem(
                title: "نوع السكن",
                desc: companySubscribeData.addSubscribeModel.accommodation,
              ),
            ],
          ),
          Row(
            children: [
              BuildReviewItem(
                title: "مستوي التعليم",
                desc: companySubscribeData.addSubscribeModel.education,
              ),
              BuildReviewItem(
                title: "عدد افراد الاسرة",
                desc: companySubscribeData.addSubscribeModel.numberFamily,
              ),
            ],
          ),
          Row(
            children: [
              BuildReviewItem(
                title: "متوسط الدخل في السنة",
                desc: companySubscribeData.addSubscribeModel.averageIncome,
              ),
              BuildReviewItem(
                title: "الفئة العمرية",
                desc: companySubscribeData.addSubscribeModel.ageGroup,
              ),
            ],
          ),
          Row(
            children: [
              BuildReviewItem(
                title: "الاشخاص مهتمين ب",
                desc: companySubscribeData.addSubscribeModel.interests,
              ),
            ],
          ),
          BuildImages(companySubscribeData: companySubscribeData,),
          BuildFiles(companySubscribeData: companySubscribeData,),
        ],
      ),
    );
  }
}
