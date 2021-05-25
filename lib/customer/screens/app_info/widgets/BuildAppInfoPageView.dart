part of'AppInfoWidgetsImports.dart';
class BuildAppInfoPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics()
      ),
      children: [
        BuildAppInfoText(),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: BuildProfileItem(
            title: "عن التطبيق",
            icon: Icons.assignment,
            onTap: () => AutoRouter.of(context).push(AboutRoute()),
          ),
        ),
        Container(
          // padding: const EdgeInsets.symmetric(vertical: 5),
          child: BuildProfileItem(
            title: "الشروط والأحكام",
            icon: MdiIcons.newspaper,
            onTap: () => AutoRouter.of(context).push(TermsRoute()),
          ),
        ),
      ],
    );
  }
}
