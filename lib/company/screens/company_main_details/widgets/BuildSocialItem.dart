part of 'DetailsWidgetsImports.dart';

class BuildSocialItem extends StatelessWidget {
  final String image;
  final Function()? onTap;

  const BuildSocialItem({required this.image, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 35,
        width: 35,
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: MyColors.white),
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Image.asset(image),
      ),
    );
  }
}
