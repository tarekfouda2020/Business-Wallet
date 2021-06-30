part of 'CompAccountWidgetsImports.dart';

class BuildAccountItem extends StatelessWidget {
  final String? title;
  final IconData iconData;
  final Widget? page;
  final Function()? onTap;

  BuildAccountItem({this.title, required this.iconData, this.page, this.onTap});

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
              child:  Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      color: MyColors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      iconData,
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
        return page??Container();
      },
    );
  }
}
