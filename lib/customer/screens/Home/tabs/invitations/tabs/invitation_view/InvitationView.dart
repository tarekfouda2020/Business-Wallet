part of 'InvitationViewImports.dart';

class InvitationView extends StatefulWidget {
  final InvitationsData invitationsData;

  const InvitationView({required this.invitationsData});

  @override
  _InvitationViewState createState() => _InvitationViewState();
}

class _InvitationViewState extends State<InvitationView> {
  @override
  void initState() {
    widget.invitationsData.pagingController.addPageRequestListener((pageKey) {
      widget.invitationsData.fetchPage(pageKey, context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PagedListView<int, InvitationModel>(
      physics: BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      pagingController: widget.invitationsData.pagingController,
      builderDelegate: PagedChildBuilderDelegate<InvitationModel>(
        itemBuilder: (context, item, index) => BuildFavoritesItem(
          invitationModel: item,
        ),
      ),
    );
  }
}
