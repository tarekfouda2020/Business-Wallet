part of 'WalletWidgetsImports.dart';

class BuildItemText extends StatelessWidget {
  final String? text;
  final String? title;
  final bool showButton;
  final bool showText;

  final desc;

  const BuildItemText(
      {required this.text,
      required this.title,
      this.showButton = false,
      this.showText = false,
      this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MyText(
                        title: text ?? "",
                        color: MyColors.greyWhite.withOpacity(0.7),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Visibility(
                        visible: showButton,
                        child: InkWell(
                          onTap: () =>
                              AutoRouter.of(context).push(DetailsRoute()),
                          child: Container(
                            alignment: Alignment.center,
                            width: 50,
                            height: 25,
                            decoration: BoxDecoration(
                              color: MyColors.primary,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: MyText(
                              title: "التفاصيل",
                              size: 7,
                              color: MyColors.black,
                              alien: TextAlign.center,
                            ),
                          ),
                        ),
                        replacement: Container(),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: MyText(
                    title: title ?? "",
                    color: MyColors.greyWhite.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: showText,
            child: Row(
              children: [
                MyText(
                  title: desc,
                  color: MyColors.greyWhite.withOpacity(0.7),
                  size: 10,
                ),
              ],
            ),
            replacement: Container(),
          ),
          Divider(thickness: 2),
        ],
      ),
    );
  }
}
