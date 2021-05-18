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
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: MyColors.darken,
        appBar: BuildAppBar(
          companyInvitationData: companyInvitationData,
        ),
        body: TabBarView(
          children: [
            InvitationMenu(),
            InvitationMenu(),
          ],
        ),
      ),
    );
  }
}
