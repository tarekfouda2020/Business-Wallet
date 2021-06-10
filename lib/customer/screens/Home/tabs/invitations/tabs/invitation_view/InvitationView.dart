part of 'InvitationViewImports.dart';

class InvitationView extends StatefulWidget {
  @override
  _InvitationViewState createState() => _InvitationViewState();
}

class _InvitationViewState extends State<InvitationView> {
  final InvitationViewData invitationViewData = new InvitationViewData();

  @override
  void initState() {
    invitationViewData.pagingController.addPageRequestListener((pageKey) {
      invitationViewData.fetchPage(pageKey, 0, 0, "M", context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PagedListView<int, InvitationModel>(
      physics: BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      pagingController: invitationViewData.pagingController,
      builderDelegate: PagedChildBuilderDelegate<InvitationModel>(
        itemBuilder: (context, item, index) => BuildFavoritesItem(
          invitationModel: item,
        ),
      ),
    );
  }
}
