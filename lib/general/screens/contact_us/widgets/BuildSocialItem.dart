part of 'ContactUsWidgetsImports.dart';

class BuildSocialItem extends StatelessWidget {
  final IconData? iconData;
  final Function() onTap;

  BuildSocialItem({this.iconData,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 15),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: MyColors.black, borderRadius: BorderRadius.circular(10)),
        child: Icon(
          iconData,
          color: MyColors.offWhite.withOpacity(.7),
        ),
      ),
    );
  }
}
