part of 'CompAccountWidgetsImports.dart';

class BuildPublicData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      children: [
        BuildAccountItem(
          title: "مشاركة التطبيق",
          iconData: Icons.share,
        ),
        BuildAccountItem(
          title: "معلومات التطبيق",
          iconData: Icons.settings,
        ),
      ],
    );
  }
}
