part of 'MainPageWidgetsImports.dart';

class BuildMainSearch extends StatelessWidget {
  final MainPageData mainPageData;

  BuildMainSearch({required this.mainPageData});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BuildHeaderDrop(
          title: "المنطقة",
          onTap: () {},
        ),
        BuildHeaderDrop(
          title: "الاهتمامات",
          onTap: () {},
        ),
        BuildHeaderDrop(
          title: "أخرى",
          onTap: () {},
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: MyColors.primary,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
          child: MyText(
            title: "البحث",
            size: 10,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}
