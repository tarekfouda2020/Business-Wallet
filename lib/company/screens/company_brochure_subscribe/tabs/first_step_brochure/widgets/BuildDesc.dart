part of 'FirstStepBrochureWidgetsImports.dart';

class BuildDesc extends StatelessWidget {
  final String desc;

  const BuildDesc({required this.desc});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BuildAdsItem(
          title: "وصف الاعلان",
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: MyText(
            title:desc,
            size: 11,
            color: MyColors.grey,
          ),
        )
      ],
    );
  }
}
