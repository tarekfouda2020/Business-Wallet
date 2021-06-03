part of 'ProviderDetailsWidgetsImports.dart';

class BuildUserPhoto extends StatelessWidget {
  final String baseImg;

  BuildUserPhoto({required this.baseImg});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        border: Border.all(
          color: MyColors.primary,
        ),
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(6),
      child: CachedImage(
        url:baseImg,
        haveRadius: false,
        width: 50,
        height: 50,
        boxShape: BoxShape.circle,
      ),
    );
  }
}
