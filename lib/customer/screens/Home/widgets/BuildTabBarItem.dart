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
        padding: EdgeInsets.only(top: 5),
        child: Column(
          children: [
            Container(
              width: 35,
              height: 35,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Icon(
                    homeData.tabs[index].iconData,
                    color: color,
                    size: 25,
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: BuildNotifyWidget(
                      count: context.watch<FollowCountCubit>().state.count,
                      index: index,
                      specific: 1,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: BuildNotifyWidget(
                      count: context.watch<InvistCountCubit>().state.count,
                      index: index,
                      specific: 2,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            MyText(
              title: homeData.tabs[index].title ?? "",
              size: 8,
              color: color,
            )
          ],
        ));
  }
}
