part of 'CompanyWidgetsImports.dart';

class BuildTabBarBody extends StatelessWidget {
  final CompanyHomeData companyHomeData;
  final int? index;

  const BuildTabBarBody({required this.companyHomeData, this.index});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<int>, GenericState<int>>(
      bloc: companyHomeData.homeTabCubit,
      builder: (_, state) {
        return AnimatedBottomNavigationBar.builder(
          itemCount: 4,
          tabBuilder: (int index, bool isActive) {
            return BuildTabBarItem(
              index: index,
              active: isActive,
              companyHomeData: companyHomeData,
            );
          },
          backgroundColor: MyColors.black.withOpacity(0.95),
          activeIndex: state.data,
          notchAndCornersAnimation: companyHomeData.animation,
          splashSpeedInMilliseconds: 300,
          notchSmoothness: NotchSmoothness.defaultEdge,
          gapLocation: GapLocation.center,
          leftCornerRadius: 0,
          rightCornerRadius: 0,
          height: Platform.isIOS? 75 :  65,
          onTap: (index) => companyHomeData.animateTabsPages(index, context),
        );
      },
    );
  }
}
