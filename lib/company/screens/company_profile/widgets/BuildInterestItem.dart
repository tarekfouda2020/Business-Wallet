part of 'CompProfileWidgetsImports.dart';

class BuildInterestItem extends StatelessWidget {
  final String title;

  BuildInterestItem({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12,horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: MyColors.black,
        borderRadius: BorderRadius.circular(40),
      ),
      child: MyText(
        title: title,
        size: 10,
        alien: TextAlign.center,
        color: MyColors.greyWhite.withOpacity(.9),
      ),
    );
  }
}
