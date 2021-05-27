part of 'MainPageWidgetsImports.dart';

class BuildMainSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BuildHeaderDrop(title: "المنطقة"),
        BuildHeaderDrop(title: "الاهتمامات"),
        BuildHeaderDrop(title: "أخرى"),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: MyColors.primary,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
