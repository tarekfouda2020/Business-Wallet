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
      body: ListView.builder(
        padding: const EdgeInsets.only(bottom: 55),
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        itemCount: 3,
        itemBuilder: (_, index){
          return BuildFavoritesItem();
        },
      ),
    );
  }
}
