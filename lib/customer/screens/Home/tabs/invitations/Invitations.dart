part of 'InvitationsImports.dart';

class Invitations extends StatefulWidget {
  @override
  _InvitationsState createState() => _InvitationsState();
}

class _InvitationsState extends State<Invitations> {
  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      title: "دعوة الإستثمار",
      search: BuildInvSearch(),
      body: Container(),
    );
  }
}
