part of 'ProviderDetailsWidgetsImports.dart';

class BuildContactWidget extends StatelessWidget {
  final String title;
  final String detail;
  final IconData icon;
  final Color? iconColor;
  final Function()? onTap;
  final bool allLocation;

  const BuildContactWidget(
      {required this.title,
      required this.detail,
      required this.icon,
      this.iconColor,
      this.allLocation = true,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          title: title,
          size: 10.5,
          color: MyColors.greyWhite.withOpacity(.9),
        ),
        InkWell(
          onTap:onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    icon,
                    color: iconColor,
                    size: 13,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  MyText(
                    title: detail,
                    size: 10,
                    color: MyColors.grey,
                  ),
                ],
              ),
              Visibility(
                visible: allLocation,
                child: Container(),
                replacement: InkWell(
                  onTap: ()=>AutoRouter.of(context).push(AllBranchesRoute()),
                  child: MyText(
                    title: "(مشاهدة جميع المواقع)",
                    size: 11,
                    color: MyColors.primary,
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
