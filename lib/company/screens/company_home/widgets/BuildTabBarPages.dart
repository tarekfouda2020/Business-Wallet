part of 'CompanyWidgetsImports.dart';

class BuildTabBarPages extends StatelessWidget {
  final CompanyHomeData companyHomeData;

  const BuildTabBarPages({required this.companyHomeData});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: companyHomeData.tabController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        CompanyFavorite(),
        CompanyFollowers(),
        CompanyInvitation(),
        CompanyAccount(),
        CompSwitchedPage(),
      ],
    );
  }
}
