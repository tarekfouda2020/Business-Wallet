part of 'ProviderDetailsWidgetsImports.dart';

class BuildPicture extends StatelessWidget {
  final String backGroundImg;

  BuildPicture({required this.backGroundImg});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: CachedImage(
        url:backGroundImg,
        borderRadius: BorderRadius.circular(10),
        width: MediaQuery.of(context).size.width,
        borderColor: MyColors.greyWhite,
        height: 170,
      ),
    );
  }
}
