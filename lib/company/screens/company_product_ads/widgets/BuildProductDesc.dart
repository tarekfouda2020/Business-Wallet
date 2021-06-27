part of 'CompProductAdsWidgetsImports.dart';

class BuildProductDesc extends StatelessWidget {
  final String desc;

  const BuildProductDesc({required this.desc});
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: desc == "",
      replacement: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child: MyText(
          title: desc,
          size: 12,
          color: MyColors.white,
        ),
      ),
      child: Center(
        child: MyText(
          title: "لا يوجد",
        ),
      ),
    );
  }
}
