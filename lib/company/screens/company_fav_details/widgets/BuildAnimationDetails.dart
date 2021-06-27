part of 'CompFavDetailsWidgetsImports.dart';

class BuildAnimationDetails extends StatelessWidget {
  final CompanyFavDetailsData companyFavDetailsData;
  final CompFavDetailsModel compFavDetailsModel;

  const BuildAnimationDetails(
      {required this.companyFavDetailsData, required this.compFavDetailsModel});

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
              height: 80,
              width: 80,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: MyColors.darken),
              child: CircularStepProgressIndicator(
                totalSteps: 40,
                currentStep: companyFavDetailsData.animation.value.toInt(),
                stepSize: 7,
                selectedColor: MyColors.primary,
                unselectedColor: MyColors.greyWhite,
                padding: math.pi / 80,
                width: 80,
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: MyText(
                        title: compFavDetailsModel.point.toString(),
                        size: 8,
                      ),
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
