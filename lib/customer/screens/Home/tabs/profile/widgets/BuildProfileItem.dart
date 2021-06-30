part of 'ProfileWidgetsImports.dart';

class BuildProfileItem extends StatelessWidget {
  final IconData icon;
  final String? title;
  final Widget? page;
  final bool isWallet;
  final Function()? onTap;

  const BuildProfileItem(
      {required this.icon,
       this.title,
      this.page,
      this.isWallet = false,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedElevation: 0,
      openElevation: 0,
      closedColor: MyColors.darken,
      openColor: MyColors.darken,
      transitionDuration: Duration(milliseconds: 800),
      transitionType: ContainerTransitionType.fadeThrough,
      closedBuilder: (context, action) {
        return Column(
          children: [
            InkWell(
              onTap: onTap,
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      color: MyColors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      icon,
                      color: MyColors.primary.withOpacity(.8),
                    ),
                  ),
                  MyText(
                    title: title ?? "",
                    color: Colors.white70,
                    size: 12,
                  ),
                ],
              ),
            ),
            Divider(
              color: MyColors.greyWhite.withOpacity(.9),
              thickness: 1,
              height: 20,
            )
          ],
        );
      },
      openBuilder: (context, action) {
        return page ?? Container();
      },
    );
  }
}
