part of 'CompanyWidgetsImports.dart';

class BuildTabBarItem extends StatelessWidget {
  final bool active;
  final int index;

  final CompanyHomeData companyHomeData;

  const BuildTabBarItem(
      {required this.companyHomeData,
      required this.active,
      required this.index});

  @override
  Widget build(BuildContext context) {
    Color color = active ? MyColors.primary : MyColors.grey;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Icon(
        companyHomeData.tabs[index].iconData,
        color: color,
        size: 25,
      ),
    );
  }
}
