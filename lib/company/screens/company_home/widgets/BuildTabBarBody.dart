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
        onTap: companyHomeData.onChangePage,
        unselectedLabelColor: Colors.grey,
        indicatorSize: TabBarIndicatorSize.tab,
        labelPadding: EdgeInsets.symmetric(vertical: 10),
        labelStyle: context.read<LangCubit>().state.locale.languageCode != "en"
            ? GoogleFonts.cairo(fontSize: 13)
            : GoogleFonts.roboto(fontSize: 13),
        tabs: [
          Tab(
            icon: Icon(
              MdiIcons.heart,
              size: 25,
            ),
            text: "المفضلة",
          ),
          Tab(
            icon: Icon(
              MdiIcons.store,
              size: 25,
            ),
            text: "متابعتي",
          ),
          Tab(
            icon: Icon(
              MdiIcons.home,
              size: 25,
              color: Colors.transparent,
            ),
            text: "",
          ),
          Tab(
            icon: Icon(
              MdiIcons.bullhorn,
              size: 25,
            ),
            text: "دعوة تجارية",
          ),
          Tab(
            icon: Icon(
              MdiIcons.viewDashboard,
              size: 20,
            ),
            text: "حسابي",
          ),
        ],
      ),
    );
  }
}
