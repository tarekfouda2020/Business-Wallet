part of 'CompMainWidgetsImports.dart';

class BuildMenuView extends StatelessWidget {
  final CompanyMainData companyMainData;

  BuildMenuView({required this.companyMainData});

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
    );  }
}
