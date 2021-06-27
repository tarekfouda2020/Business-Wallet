part of 'CompFavDetailsWidgetsImports.dart';

class BuildContactItem extends StatelessWidget {
  final String? title;
  final IconData? iconData;
  final Color? color;
  final String? desc;
  final Function()? onTap;

  BuildContactItem(
      {this.title, this.iconData, this.color, this.desc, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
              title: title ?? "",
              size: 12,
              color: MyColors.grey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  iconData,
                  color: color,
                  size: 13,
                ),
                SizedBox(
                  width: 3,
                ),
                Flexible(
                  child: MyText(
                    title: desc ??"",
                    size: 10,
                    color: MyColors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
