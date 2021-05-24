part of 'CompWalletNumbWidgetsImports.dart';

class BuildTextItem extends StatelessWidget {
  final String? title;

  BuildTextItem({this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Icon(
            Icons.circle,
            color: MyColors.white,
            size: 12,
          ),
        ),
        Flexible(
          child: Container(
            margin: const EdgeInsets.all(5),
            child: MyText(
              title: title ?? "",
              size: 11,
              color: MyColors.white,
            ),
          )
        )
      ],
    );
  }
}
