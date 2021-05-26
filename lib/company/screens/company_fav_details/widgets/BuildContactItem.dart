part of 'CompFavDetailsWidgetsImports.dart';

class BuildContactItem extends StatelessWidget {
  final String? title;
  final IconData? iconData;
  final Color? color;
  final String? desc;

  BuildContactItem({this.title, this.iconData, this.color, this.desc});

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                MyText(
                  title: desc ?? "",
                  size: 10,
                  color: MyColors.grey,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
