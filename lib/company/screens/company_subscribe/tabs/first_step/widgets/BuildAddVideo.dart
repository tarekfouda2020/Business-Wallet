part of 'FirstStepWidgetsImports.dart';

class BuildAddVideo extends StatelessWidget {
  final FirstStepData firstStepData;

  BuildAddVideo({required this.firstStepData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyText(
            title: "ادراج فيديو ",
            size: 11,
            color: MyColors.white,
          ),
          IconButton(
            icon: Icon(
              MdiIcons.plusCircle,
              color: MyColors.primary,
              size: 35,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}