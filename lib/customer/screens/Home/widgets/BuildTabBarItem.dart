part of 'HomeWidgetsImports.dart';

class BuildTabBarItem extends StatelessWidget {
  // final IconData icon;
  final bool active;
  final int index;
  // final int count;
  // final int current;
  final HomeData homeData;

  const BuildTabBarItem(
      {required this.homeData, required this.active, required this.index});

  @override
  Widget build(BuildContext context) {
    Color color = active ? MyColors.primary : MyColors.grey;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          Icon(
            homeData.tabs[index].iconData,
            color: color,
            size: 25,
          ),
          MyText(title: homeData.tabs[index].title??"", size: 8, color: color,)
        ],
      )
    );
  }
}
