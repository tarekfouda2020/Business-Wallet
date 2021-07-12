part of 'InvitationsImports.dart';

class InvitationsData {
  String filterId = "M";
  final GlobalKey<ScaffoldState> scaffold = new GlobalKey();
  final PagingController<int, InvitationModel> pagingController =
      PagingController(firstPageKey: 1);
  late TabController tabController ;
  final MapScreenData mapScreenData = new MapScreenData();


  late List<InvitationModel> invitationData;
  int pageSize = 10;

  void fetchPage(int pageIndex, BuildContext context,
      {bool refresh = true}) async {
    invitationData = await CustomerRepository(context)
        .getInvitationData(pageIndex, 0, 0, filterId,refresh);
    final isLastPage = invitationData.length < pageSize;
    if (pageIndex == 1) {
      pagingController.itemList = [];
    }
    if (isLastPage) {
      pagingController.appendLastPage(invitationData);
    } else {
      final nextPageKey = pageIndex + 1;
      pagingController.appendPage(invitationData, nextPageKey);
    }
  }

  void selectType(FilterModel? model) {
    if (model != null) filterId = model.id;
  }


  Future<List<InvitationModel>> fetchMapPage(BuildContext context, {bool refresh = true}) async {
    var data = await CustomerRepository(context)
        .getInvitationData(1, 0, 0, filterId,refresh);
    return data;
  }

  refreshCurrentPage(BuildContext context, InvitationsData invitationsData)async {
    if (tabController.index == 0) {
      pagingController.refresh();
    } else {
      LoadingDialog.showLoadingDialog();
      await mapScreenData.fetchPage(context, invitationsData);
      EasyLoading.dismiss();
    }
  }

}
