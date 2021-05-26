part of 'CompFavDetailsWidgetsImports.dart';

class BuildAdsItem extends StatelessWidget {
  final String? title;

  BuildAdsItem({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: const EdgeInsets.symmetric(vertical: 5),
      color: MyColors.black,
      child: Row(
        children: [
          MyText(
            title: title ?? "",
            color: MyColors.greyWhite.withOpacity(.9),
            size: 12,
          )
        ],
      ),
    );
  }
}
