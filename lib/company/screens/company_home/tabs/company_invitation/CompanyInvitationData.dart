part of 'CompanyInvitationImports.dart';

class CompanyInvitationData {
  final PagingController<int, CompInvitationModel> pagingController =
      PagingController(firstPageKey: 1);
  late List<CompInvitationModel> invitationData;
  int pageSize = 10;

  void fetchPage(int pageIndex, BuildContext context,
      {bool refresh = true}) async {
    invitationData =
        await CompanyRepository(context).getInvitationData(pageIndex, refresh);
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

  Future<List<CompInvitationModel>> fetchMapPage(BuildContext context,
      {bool refresh = true}) async {
    var data = await CompanyRepository(context).getInvitationData(1, refresh);
    return data;
  }
}
