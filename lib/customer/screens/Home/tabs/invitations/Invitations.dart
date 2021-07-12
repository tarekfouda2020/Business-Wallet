part of 'InvitationsImports.dart';

class Invitations extends StatefulWidget {
  @override
  _InvitationsState createState() => _InvitationsState();
}

class _InvitationsState extends State<Invitations> with TickerProviderStateMixin {
  final InvitationsData invitationsData = new InvitationsData();


  @override
  void initState() {
    super.initState();
    invitationsData.tabController = new TabController(length: 2, vsync: this);
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: HomeScaffold(
        title: "دعوة تجارية",
        search: BuildInvSearch(
          invitationsData: invitationsData,
        ),
        body: Column(
          children: [
            BuildChangeView(tabController: invitationsData.tabController,),
            Flexible(
              child: TabBarView(
                controller: invitationsData.tabController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  InvitationView(invitationsData: invitationsData),
                  MapScreen(invitationsData: invitationsData),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
