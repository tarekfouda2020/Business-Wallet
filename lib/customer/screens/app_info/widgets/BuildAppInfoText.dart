part of'AppInfoWidgetsImports.dart';
class BuildAppInfoText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      width: MediaQuery.of(context).size.width,
      color: MyColors.black,
      child: MyText(
        title: "معلومات التطبيق",
        color: MyColors.primary,
      ),
    );
  }
}
