part of 'EditActivityWidgetsImports.dart';

class BuildText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      color: MyColors.black,
      child:  MyText(
        title: "مجالات المنشأة",
        color: MyColors.greyWhite.withOpacity(.9),
        size: 12,
      ),
    );
  }
}
