part of 'CompanyInvitationImports.dart';

class CompanyInvitation extends StatefulWidget {
  @override
  _CompanyInvitationState createState() => _CompanyInvitationState();
}

class _CompanyInvitationState extends State<CompanyInvitation> {
  final CompanyInvitationData companyInvitationData =
      new CompanyInvitationData();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: HomeScaffold(
        scaffold: companyInvitationData.scaffold,
        title: "دعوة تجارية",
        search: BuildMenuView(
          companyInvitationData: companyInvitationData,
        ),
        body: TabBarView(
          children: [
            InvitationMenu(companyInvitationData: companyInvitationData,),
            InvitationMap(companyInvitationData: companyInvitationData,),
          ],
        ),
      ),
    );
  }
}
