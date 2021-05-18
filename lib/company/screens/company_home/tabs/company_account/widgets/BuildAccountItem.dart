part of 'CompAccountWidgetsImports.dart';

class BuildAccountItem extends StatelessWidget {
  final String? title;
  final IconData iconData;

  BuildAccountItem({this.title, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
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
                color: MyColors.greyWhite.withOpacity(.9),
              ),
            ),
            MyText(
              title: title ?? "",
              color: MyColors.greyWhite.withOpacity(.9),
              size: 12,
            ),
          ],
        ),
       Divider(
         color: MyColors.greyWhite.withOpacity(.9),
         thickness: 1,
         height: 20,
       )
      ],
    );
  }
}