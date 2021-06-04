part of 'SearchWidgetsImports.dart';

class BuildSearchDrops extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BuildHeaderDrop(title: "الكل",onTap: (){},),
          BuildHeaderDrop(title: "صنف حسب",onTap: (){},),


          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: MyColors.primary,
            ),
            padding: const EdgeInsets.symmetric(
                horizontal: 10, vertical: 5),
            child: MyText(
              title: "البحث",
              size: 10,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
