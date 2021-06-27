part of 'CompPackagesWidgetsImports.dart';
class BuildTextItem extends StatelessWidget {
  final String contentItem;

  const BuildTextItem({required this.contentItem});
  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        MyText(
          title: contentItem,
          size: 10,
          color: MyColors.offWhite,
        ),
        Divider(
          color: MyColors.primary,
        )
      ],
    );
  }
}
