part of 'InvitationsImports.dart';

class InvitationsData {
  String filterId = "M";

  final PagingController<int, InvitationModel> pagingController =
      PagingController(firstPageKey: 1);
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
}
