part of 'ContactUsWidgetsImports.dart';

class BuildSocialView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyText(
          title: "وسائل التواصل الاجتماعي",
          size: 13,
          color: MyColors.primary,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BuildSocialItem(iconData: MdiIcons.facebook),
            BuildSocialItem(iconData: MdiIcons.whatsapp),
            BuildSocialItem(iconData: MdiIcons.twitter),
            BuildSocialItem(iconData: MdiIcons.instagram),
          ],
        )
      ],
    );
  }
}
