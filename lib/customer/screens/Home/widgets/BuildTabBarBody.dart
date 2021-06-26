part of 'HomeWidgetsImports.dart';

class BuildTabBarBody extends StatelessWidget {
  final HomeData homeData;
  final int? index;

  const BuildTabBarBody({required this.homeData, this.index});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<int>, GenericState<int>>(
      bloc: homeData.homeTabCubit,
      builder: (_, state) {
        return AnimatedBottomNavigationBar.builder(
          itemCount: 4,
          tabBuilder: (int index, bool isActive) {
            return BuildTabBarItem(
              index: index,
              homeData: homeData,
              active: isActive,
            );
          },
          backgroundColor: MyColors.black.withOpacity(0.95),
          activeIndex: state.data,
          notchAndCornersAnimation: homeData.animation,
          splashSpeedInMilliseconds: 300,
          notchSmoothness: NotchSmoothness.defaultEdge,
          gapLocation: GapLocation.center,
          leftCornerRadius: 0,
          rightCornerRadius: 0,
          height: Platform.isIOS? 75 :  65,
          onTap: (index) => homeData.animateTabsPages(index, context),
        );
      },
    );
  }
}
