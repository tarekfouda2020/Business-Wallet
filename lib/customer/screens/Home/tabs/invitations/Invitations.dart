part of 'InvitationsImports.dart';

class Invitations extends StatefulWidget {
  @override
  _InvitationsState createState() => _InvitationsState();
}

class _InvitationsState extends State<Invitations> {
  final InvitationsData invitationsData = new InvitationsData();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: HomeScaffold(
        title: "دعوة تجارية",
        search: BuildInvSearch(),
        body: Column(
          children: [
            BuildChangeView(),
            Flexible(
              child: TabBarView(
                children: [
                  InvitationView(),
                  InvitationView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
