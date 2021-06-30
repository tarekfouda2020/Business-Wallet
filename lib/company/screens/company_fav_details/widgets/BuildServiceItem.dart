part of 'CompFavDetailsWidgetsImports.dart';

class BuildServiceItem extends StatelessWidget {
  final String? title;
  final String? price;

  BuildServiceItem({required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                title: title ??"",
                size: 12,
                color: MyColors.grey,
              ),
              MyText(
                title: price ?? "",
                size: 12,
                color: MyColors.grey,
              ),
            ],
          ),
        ),
        Divider(
          color: MyColors.grey,
          height: 27,
        )
      ],
    );
  }
}
