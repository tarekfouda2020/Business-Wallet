part of 'InvitationMenuImports.dart';

class InvitationMenu extends StatefulWidget {
  final CompanyInvitationData companyInvitationData;

  const InvitationMenu({required this.companyInvitationData});

  @override
  _InvitationMenuState createState() => _InvitationMenuState();
}

class _InvitationMenuState extends State<InvitationMenu> {
  @override
  void initState() {
    widget.companyInvitationData.fetchPage(1, context,refresh: false);
    widget.companyInvitationData.pagingController
        .addPageRequestListener((pageKey) {
      widget.companyInvitationData.fetchPage(pageKey, context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PagedListView<int, CompInvitationModel>(
      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
      physics: BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      pagingController: widget.companyInvitationData.pagingController,
      builderDelegate: PagedChildBuilderDelegate<CompInvitationModel>(
        itemBuilder: (context, item, index) => BuildInviteItem(
          invitationModel: item,
        ),
      ),
    );
  }
}
