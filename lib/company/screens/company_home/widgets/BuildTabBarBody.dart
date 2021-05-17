part of 'CompanyWidgetsImports.dart';

class BuildTabBarBody extends StatelessWidget {
  final CompanyHomeData companyHomeData;

  const BuildTabBarBody({required this.companyHomeData});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        color: MyColors.black,
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 5.0,
          ),
        ],
      ),
      child: TabBar(
        labelColor: MyColors.primary,
        indicator: BoxDecoration(
          color: MyColors.black,
        ),
        unselectedLabelColor: Colors.grey,
        indicatorSize: TabBarIndicatorSize.tab,
        controller: companyHomeData.tabController,
        labelPadding: EdgeInsets.symmetric(vertical: 10),
        tabs: [
          Tab(
            icon: Icon(
              MdiIcons.heart,
              size: 20,
            ),
            text: "المفضلة",
          ),
          Tab(
            icon: Icon(
              MdiIcons.store,
              size: 20,
            ),
            text: "متابعتي",
          ),
          Tab(
            icon: Icon(
              MdiIcons.home,
              size: 20,
              color: Colors.transparent,
            ),
            text: "",
          ),
          Tab(
            icon: Icon(
              MdiIcons.bullhorn,
              size: 20,
            ),
            text: "دعوة تجارية",
          ),
          Tab(
            icon: Icon(
              MdiIcons.vectorSquare,
              size: 20,
            ),
            text: "حسابي",
          ),
        ],
      ),
    );
  }
}
