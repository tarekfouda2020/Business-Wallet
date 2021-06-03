part of 'CompActiveAccountWidgetsImports.dart';

class BuildText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            title: "كود التفعيل",
            color: MyColors.white,
          ),

        ],
      ),
    );
  }
}
