part of 'CompSpecificAdsWidgetsImports.dart';

class BuildAnimationDetail extends StatelessWidget {
  final CompSpecificAdsData compSpecificAdsData;
  final AdsDetailsModel adsDetailsModel;

  const BuildAnimationDetail(
      {required this.compSpecificAdsData, required this.adsDetailsModel});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 70,
              width: 70,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: MyColors.darken),
              child: CircularStepProgressIndicator(
                totalSteps: 40,
                currentStep: compSpecificAdsData.animation.value.toInt(),
                stepSize: 7,
                selectedColor: MyColors.primary,
                unselectedColor: MyColors.greyWhite,
                padding: math.pi / 80,
                width: 70,
                height: 70,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyText(
                      title: adsDetailsModel.point.toString(),
                      size: 10,
                    ),
                    MyText(
                      title: "نقطة",
                      size: 8.5,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
