part of 'CompanySubscribeWidgetsImports.dart';

class BuildStepper extends StatelessWidget {
  final bool step1;
  final bool step2;
  final bool step3;
  final bool step4;

  const BuildStepper(
      {this.step1 = false,
      this.step2 = false,
      this.step3 = false,
      this.step4 = false});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Positioned(
          bottom: 30,
          left: 80,
          right: 80,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 6),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border.all(color: MyColors.white, width: 1),
            ),
          ),
        ),
        Container(
          height: 75,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                height: 45,
                width: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: MyColors.darken,
                    border: Border.all(
                      color: step1 || step2 || step3 || step4 == true
                          ? MyColors.primary
                          : MyColors.white,
                      width: 1,
                    ),
                    shape: BoxShape.circle),
                child: MyText(
                  title: "1",
                  size: 14,
                  fontWeight: FontWeight.bold,
                  color: step1 || step2 || step3 || step4 == true
                      ? MyColors.primary
                      : MyColors.white,
                ),
              ),
              Container(
                height: 45,
                width: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: MyColors.darken,
                    border: Border.all(
                      color: step2 || step3 || step4 == true
                          ? MyColors.primary
                          : MyColors.white,
                      width: 1,
                    ),
                    shape: BoxShape.circle),
                child: MyText(
                  title: "2",
                  size: 14,
                  fontWeight: FontWeight.bold,
                  color: step2 || step3 || step4 == true
                      ? MyColors.primary
                      : MyColors.white,
                ),
              ),
              Container(
                height: 45,
                width: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: MyColors.darken,
                    border: Border.all(
                      color: step3 || step4 == true
                          ? MyColors.primary
                          : MyColors.white,
                      width: 1,
                    ),
                    shape: BoxShape.circle),
                child: MyText(
                  title: "3",
                  size: 14,
                  fontWeight: FontWeight.bold,
                  color: step3 || step4 == true
                      ? MyColors.primary
                      : MyColors.white,
                ),
              ),
              Container(
                height: 45,
                width: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: MyColors.darken,
                    border: Border.all(
                      color: step4 == true ? MyColors.primary : MyColors.white,
                      width: 1,
                    ),
                    shape: BoxShape.circle),
                child: MyText(
                  title: "4",
                  size: 14,
                  fontWeight: FontWeight.bold,
                  color: step4 == true ? MyColors.primary : MyColors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
