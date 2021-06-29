part of 'ThirdStepOpinionWidgetsImports.dart';

class BuildReviewItem extends StatelessWidget {
  final String title;
  final String? desc;

  BuildReviewItem({required this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            title: title,
            size: 11,
            color: MyColors.primary,
          ),
          MyText(
            title: desc ?? "",
            size: 11,
            color: MyColors.white,
          ),
          Divider(
            color: MyColors.grey,
            height: 30,
          )
        ],
      ),
    );
  }
}
