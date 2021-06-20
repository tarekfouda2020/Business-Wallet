part of 'CompanyInvitationImports.dart';

class CompanyInvitationData {
  final PagingController<int, CompInvitationModel> pagingController =
      PagingController(firstPageKey: 1);
  late List<CompInvitationModel> invitationData;
  int pageSize = 10;

  void fetchPage(int pageIndex, BuildContext context) async {
    invitationData =
        await CompanyRepository(context).getInvitationData(pageIndex);
    final isLastPage = invitationData.length < pageSize;
    if (isLastPage) {
      pagingController.appendLastPage(invitationData);
    } else {
      final nextPageKey = pageIndex + 1;
      pagingController.appendPage(invitationData, nextPageKey);
    }
  }
}
