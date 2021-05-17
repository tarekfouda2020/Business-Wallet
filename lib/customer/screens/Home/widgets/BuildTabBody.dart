part of 'HomeWidgetsImports.dart';

class BuildTabBody extends StatelessWidget {
  final HomeData homeData;
  const BuildTabBody(this.homeData);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 66,
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: MyColors.secondary,
        // boxShadow: [
        //   BoxShadow(
        //     color: MyColors.grey,
        //     blurRadius: 8,
        //     spreadRadius: 0.5,
        //     offset: const Offset(0, -0.5),
        //   )
        // ]
      ),
      child: TabBar(
        indicatorColor: Colors.transparent,
        labelColor: MyColors.primary,
        unselectedLabelColor: MyColors.white,
        controller: homeData.tabController,
        labelStyle:
        GoogleFonts.cairo(fontSize: 9.5, fontWeight: FontWeight.bold),
        tabs: [
          Tab(
            icon: const Icon(
              Icons.favorite,
              size: 25,
            ),
            text: tr(context, "main"), //"الرئيسية",
          ),
          Tab(
              icon: Icon(
                Icons.store_mall_directory,
                size: 25,
              ),
              text: "متابعتي"
          ),
          Tab(
            // icon: const Icon(
            //   Icons.arrow_drop_down_outlined,
            //   size: 30,
            // ),
            text: "", //"المزيد",
          ),
          Tab(
              icon: const Icon(
                MdiIcons.bullhorn,
                size: 25,
              ),
              text: "دعوة تجارية"
          ),
          Tab(
              icon: const Icon(
                Icons.person,
                size: 25,
              ),
              text: "حسابي"
          ),
        ],
      ),
    );
  }
}
