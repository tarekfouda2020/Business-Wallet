part of 'ContactUsWidgetsImports.dart';

class BuildSocialItem extends StatelessWidget {
  final IconData? iconData;

  BuildSocialItem({this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: MyColors.black, borderRadius: BorderRadius.circular(10)),
      child: Icon(
        iconData,
        color: MyColors.offWhite.withOpacity(.7),
      ),
    );
  }
}
