part of 'MainPageWidgetsImports.dart';

class BuildChangeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 100,
          child: TabBar(
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
