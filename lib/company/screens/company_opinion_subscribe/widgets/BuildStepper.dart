part of 'CompOpinionSubscribeWidgetsImports.dart';

class BuildStepper extends StatelessWidget {
  final bool step1;
  final bool step2;
  final bool step3;
  final Function(int page) movePage;

  const BuildStepper(
      {this.step1 = false,
      this.step2 = false,
      this.step3 = false,
      required this.movePage});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Stack(
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
                InkWell(
                  onTap: () => movePage(0),
                  child: Container(
                    height: 45,
                    width: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: MyColors.darken,
                        border: Border.all(
                          color: step1 || step2 || step3 == true
                              ? MyColors.primary
                              : MyColors.white,
                          width: 1,
                        ),
                        shape: BoxShape.circle),
                    child: MyText(
                      title: "1",
                      size: 14,
                      fontWeight: FontWeight.bold,
                      color: step1 || step2 || step3 == true
                          ? MyColors.primary
                          : MyColors.white,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => movePage(1),
                  child: Container(
                    height: 45,
                    width: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: MyColors.darken,
                        border: Border.all(
                          color: step2 || step3 == true
                              ? MyColors.primary
                              : MyColors.white,
                          width: 1,
                        ),
                        shape: BoxShape.circle),
                    child: MyText(
                      title: "2",
                      size: 14,
                      fontWeight: FontWeight.bold,
                      color: step2 || step3 == true
                          ? MyColors.primary
                          : MyColors.white,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => movePage(2),
                  child: Container(
                    height: 45,
                    width: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: MyColors.darken,
                        border: Border.all(
                          color:
                              step3 == true ? MyColors.primary : MyColors.white,
                          width: 1,
                        ),
                        shape: BoxShape.circle),
                    child: MyText(
                      title: "3",
                      size: 14,
                      fontWeight: FontWeight.bold,
                      color: step3 == true ? MyColors.primary : MyColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
