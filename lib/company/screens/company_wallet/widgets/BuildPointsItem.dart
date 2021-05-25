part of 'CompWalletWidgetsImports.dart';

class BuildPointsItem extends StatelessWidget {
  final String? title;
  final String? desc;
  final bool showButton;
  final bool showText;

  const BuildPointsItem({
    required this.title,
    required this.desc,
    this.showButton = false,
    this.showText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Visibility(
                visible: showText,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      title: title ?? "",
                      size: 11,
                      color: MyColors.offWhite.withOpacity(.7),
                    ),
                    MyText(
                      title: "لا يوجد نقاط علي وشك الانتهاء",
                      size: 10,
                      color: MyColors.offWhite.withOpacity(.7),
                    ),
                  ],
                ),
                replacement: MyText(
                  title: title ?? "",
                  size: 11,
                  color: MyColors.offWhite.withOpacity(.7),
                ),
              ),
              Visibility(
                visible: showButton,
                child: InkWell(
                  onTap: () =>
                      AutoRouter.of(context).push(CompanyPointsRoute()),
                  child: Container(
                    alignment: Alignment.center,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: MyColors.primary,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: MyText(
                      title: "التفاصيل",
                      size: 9,
                      color: MyColors.black,
                      alien: TextAlign.center,
                    ),
                  ),
                ),
                replacement: Spacer(),
              ),
              Spacer(),
              MyText(
                title: desc ?? "",
                size: 11,
                color: MyColors.offWhite.withOpacity(.7),
              ),
            ],
          ),
        ),
        Divider(
          thickness: 1,
          color: MyColors.greyWhite.withOpacity(.5),
        ),
      ],
    );
  }
}
