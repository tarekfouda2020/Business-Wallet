part of 'CompanyWidgetsImports.dart';

class BuildTabBarItem extends StatelessWidget {
  final bool active;
  final int index;
  final String? title;

  final CompanyHomeData companyHomeData;

  const BuildTabBarItem(
      {required this.companyHomeData,
      required this.active,
      required this.index,
      this.title});

  @override
  Widget build(BuildContext context) {
    Color color = active ? MyColors.primary : Colors.white70;
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            companyHomeData.tabs[index].iconData,
            color: color,
            size: 25,
          ),
          MyText(
            title: companyHomeData.tabs[index].title ?? "",
            color: color,
            size: 9,
          )
        ],
      ),
    );
  }
}
