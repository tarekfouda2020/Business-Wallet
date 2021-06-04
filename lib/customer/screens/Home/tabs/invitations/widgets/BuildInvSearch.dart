part of 'InvWidgetsImports.dart';

class BuildInvSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BuildHeaderDrop(title: "الأعلى تقييم",onTap: (){},),

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
    );;
  }
}
