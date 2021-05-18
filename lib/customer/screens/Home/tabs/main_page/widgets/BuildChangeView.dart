part of 'MainPageWidgetsImports.dart';

class BuildChangeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 15,
          width: 90,
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: TabBar(
            indicatorColor: MyColors.secondary,
            tabs: [
              Tab(
                child: Image.asset(
                  Res.noun_men,
                  height: 10,
                  color: MyColors.white,
                ),
              ),
              Tab(
                child: Image.asset(
                  Res.noun_mapp,
                  height: 13,
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
