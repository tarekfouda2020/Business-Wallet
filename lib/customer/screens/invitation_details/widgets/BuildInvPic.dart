part of 'InvDetailsWidgetsImports.dart';

class BuildInvPic extends StatelessWidget {
  final String image;

  const BuildInvPic({required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(
          shape: BoxShape.circle, border: Border.all(color: MyColors.primary)),
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: CachedImage(
        url: image,
        haveRadius: false,
        width: 55,
        height: 55,
        borderColor: MyColors.white,
        boxShape: BoxShape.circle,
      ),
    );
  }
}
