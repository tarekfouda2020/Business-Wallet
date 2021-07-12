part of 'MainPageWidgetsImports.dart';

class BuildChangeView extends StatelessWidget {
  final TabController tabController;

  const BuildChangeView({required this.tabController});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 100,
          child: TabBar(
            controller: tabController,
            indicatorColor: MyColors.darken.withOpacity(.1),
            tabs: [
              Tab(
                child: Image.asset(
                  Res.noun_men,
                  color: MyColors.white,
                ),
              ),
              Tab(
                child: Image.asset(
                  Res.noun_mapp,
                  color: MyColors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class BuildChangeView2 extends StatelessWidget {

  final Function(int) onTap;

  const BuildChangeView2({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 70,
          margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: ()=> onTap(0),
                child: Image.asset(
                  Res.noun_men,
                  color: MyColors.white,
                  width: 20,
                  height: 20,
                ),
              ),
              InkWell(
                onTap: ()=> onTap(1),
                child: Image.asset(
                  Res.noun_mapp,
                  color: MyColors.white,
                  width: 20,
                  height: 20,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
