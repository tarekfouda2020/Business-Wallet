part of 'EditActivityWidgetsImports.dart';

class BuildSecondaryItem extends StatelessWidget {
  final String title;

  BuildSecondaryItem({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .45,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      decoration: BoxDecoration(
        color: MyColors.black,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MyText(
            title: title,
            size: 11,
            color: MyColors.white,
          ),
          Icon(
            MdiIcons.closeCircle,
            color: MyColors.primary,
          )
        ],
      ),
    );
  }
}
