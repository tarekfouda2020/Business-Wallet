part of'WalletWidgetsImports.dart';
class BuildTopText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      color: MyColors.black,
      child: MyText(
        title: "كشف المحفظه",
        size: 14,
        color: MyColors.greyWhite.withOpacity(0.6),
      ),
    );
  }
}
