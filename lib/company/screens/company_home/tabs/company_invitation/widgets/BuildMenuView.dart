part of 'CompInvitationWidgetsImports.dart';

class BuildMenuView extends StatelessWidget {
  final CompanyInvitationData companyInvitationData;

  BuildMenuView({required this.companyInvitationData});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: MyColors.black,
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
