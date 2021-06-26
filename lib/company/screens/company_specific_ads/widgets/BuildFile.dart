part of 'CompSpecificAdsWidgetsImports.dart';

class BuildFile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(
        onTap: () {},
        child: Row(
          children: <Widget>[
            Icon(
              MdiIcons.cloudDownload,
              color: MyColors.primary,
            ),
            SizedBox(
              width: 10,
            ),
            MyText(
              title: "تحميل الملف",
              size: 13,
              color: MyColors.white,
            ),
          ],
        ),
      ),
    );
  }
}
