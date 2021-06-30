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
    widget.invitationsData.fetchPage(1, context, refresh: false);
    widget.invitationsData.pagingController.addPageRequestListener((pageKey) {
      widget.invitationsData.fetchPage(pageKey, context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PagedListView<int, InvitationModel>(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      physics: BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      pagingController: widget.invitationsData.pagingController,
      builderDelegate: PagedChildBuilderDelegate<InvitationModel>(
        noItemsFoundIndicatorBuilder: (context) => BuildNoItemFound(),
        itemBuilder: (context, item, index) => BuildFavoritesItem(
          invitationModel: item,
        ),
      ),
    );
  }
}
