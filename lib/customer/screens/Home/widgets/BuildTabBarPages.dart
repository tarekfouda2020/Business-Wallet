part of 'HomeWidgetsImports.dart';

class BuildTabBarPages extends StatelessWidget {
  final HomeData homeData;
  const BuildTabBarPages(this.homeData);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: homeData.tabController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Favorites(),
        Followers(),
        MainPage(),
        Invitations(),
        Profile(),
      ],
    );
  }
}
