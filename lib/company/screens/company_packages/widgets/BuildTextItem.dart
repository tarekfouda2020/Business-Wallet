part of 'CompPackagesWidgetsImports.dart';
class BuildTextItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        MyText(
          title: "نصوص",
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
