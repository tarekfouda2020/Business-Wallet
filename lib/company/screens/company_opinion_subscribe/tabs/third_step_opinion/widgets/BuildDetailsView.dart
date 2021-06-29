part of 'ThirdStepOpinionWidgetsImports.dart';

class BuildDetailsView extends StatelessWidget {
  final CompOpinionSubscribeData compOpinionSubscribeData;

  const BuildDetailsView({required this.compOpinionSubscribeData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        children: [
          Row(
            children: [
              BuildReviewItem(
                title: "وصف الاعلان",
                desc: compOpinionSubscribeData.addOpinionSubscribeModel.adsDesc,
              ),
              BuildReviewItem(
                title: "عدد المشاهدات",
                desc: compOpinionSubscribeData
                    .addOpinionSubscribeModel.countWatch,
              ),
            ],
          ),
          Row(
            children: [
              BuildReviewItem(
                title: "تاريخ بداية الاعلان",
                desc:
                    compOpinionSubscribeData.addOpinionSubscribeModel.timeStart,
              ),
              BuildReviewItem(
                title: "المدينة",
                desc: compOpinionSubscribeData
                    .addOpinionSubscribeModel.fkCityName,
              ),
            ],
          ),
          Row(
            children: [
              BuildReviewItem(
                title: "الجنس",
                desc:
                    compOpinionSubscribeData.addOpinionSubscribeModel.gender ==
                            "F"
                        ? "انثي"
                        : "ذكر",
              ),
              BuildReviewItem(
                title: "نوع السكن",
                desc: compOpinionSubscribeData
                    .addOpinionSubscribeModel.accommodation,
              ),
            ],
          ),
          Row(
            children: [
              BuildReviewItem(
                title: "مستوي التعليم",
                desc:
                    compOpinionSubscribeData.addOpinionSubscribeModel.education,
              ),
              BuildReviewItem(
                title: "عدد افراد الاسرة",
                desc: compOpinionSubscribeData
                    .addOpinionSubscribeModel.numberFamily,
              ),
            ],
          ),
          Row(
            children: [
              BuildReviewItem(
                title: "متوسط الدخل في السنة",
                desc: compOpinionSubscribeData
                    .addOpinionSubscribeModel.averageIncome,
              ),
              BuildReviewItem(
                title: "الفئة العمرية",
                desc:
                    compOpinionSubscribeData.addOpinionSubscribeModel.ageGroup,
              ),
            ],
          ),
          Row(
            children: [
              BuildReviewItem(
                title: "الاشخاص مهتمين ب",
                desc: compOpinionSubscribeData
                    .addOpinionSubscribeModel.interestsNames,
              ),
            ],
          ),
          BuildImages(
            companySubscribeData: compOpinionSubscribeData,
          ),
          BuildVideosView(
            companySubscribeData: compOpinionSubscribeData,
          ),
        ],
      ),
    );
  }
}
