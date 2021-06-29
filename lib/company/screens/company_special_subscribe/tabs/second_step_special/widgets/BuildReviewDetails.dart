part of 'SecStepSpecialWidgetsImports.dart';

class BuildReviewDetails extends StatelessWidget {
  final CompSpecialSubscribeData compSpecialSubscribeData;

  const BuildReviewDetails({required this.compSpecialSubscribeData});

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
                desc:
                    compSpecialSubscribeData.addSpecialSubscribeModel.startTime,
              ),
              BuildReviewItem(
                title: "مدة الترقية",
                desc: compSpecialSubscribeData.addSpecialSubscribeModel.dayShow,
              ),
            ],
          ),
          Row(
            children: [
              BuildReviewItem(
                title: "المنطقة",
                desc: compSpecialSubscribeData
                    .addSpecialSubscribeModel.fkCityName,
              ),
              BuildReviewItem(
                title: "الاشخاص المهتمين ب",
                desc: compSpecialSubscribeData
                    .addSpecialSubscribeModel.interestsNames,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
