part of 'FirstStepWidgetsImports.dart';
class BuildHelp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child:Row(
        children: [
          MyText(
            title: "اذا واجهتك مشكلة وتحتاج الي مساعدة ",
            size: 11,
            color: MyColors.greyWhite.withOpacity(.9),
          ),
          MyText(
            title: "اضغط هنا",
            size: 11,
            color: MyColors.primary,
            decoration: TextDecoration.underline,
          ),
        ],
      )
    );
  }
}
