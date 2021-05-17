part of 'ActiveAccountWidgetsImports.dart';

class BuildText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            // title:tr(context,"activeAccount"),
            title: "كود التفعيل",
            color: MyColors.white,
          ),
          // MyText(
          //   title: tr(context,"codeSendToPhone"),
          //   // size: 13,
          //   color: MyColors.white,
          // ),
        ],
      ),
    );
  }
}
