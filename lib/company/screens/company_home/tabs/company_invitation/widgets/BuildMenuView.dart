part of 'CompInvitationWidgetsImports.dart';

class BuildMenuView extends StatelessWidget {
  final CompanyInvitationData companyInvitationData;

  BuildMenuView({required this.companyInvitationData});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: MyColors.black.withOpacity(.95),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: MyColors.black,
            spreadRadius: 1,
            blurRadius: 1,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 100,
            child: TabBar(
              indicatorColor: MyColors.black,
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
      ),
    );
  }
}
