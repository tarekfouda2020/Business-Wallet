part of 'CompFavoriteWidgetsImports.dart';

class BuildMenuView extends StatelessWidget {
  final CompanyFavoriteData companyFavoriteData;

  BuildMenuView({required this.companyFavoriteData});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 100,
          child: TabBar(
            indicatorColor: MyColors.secondary,
            tabs: [
              Tab(
                icon: Image.asset(
                  Res.noun_men,
                ),
              ),
              Tab(
                icon: Image.asset(
                  Res.noun_mapp,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
