part of 'DetailsWidgetsImports.dart';

class BuildProductImg extends StatelessWidget {
  final String backGroundImg;

  BuildProductImg({required this.backGroundImg});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: CachedImage(
        url: backGroundImg,
        borderRadius: BorderRadius.circular(10),
        width: MediaQuery.of(context).size.width,
        borderColor: MyColors.greyWhite,
        height: 170,
      ),
    );
  }
}
