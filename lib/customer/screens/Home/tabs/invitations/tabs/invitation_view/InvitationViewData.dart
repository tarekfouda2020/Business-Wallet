part of 'InvitationViewImports.dart';

class InvitationViewData {
  final PagingController<int, InvitationModel> pagingController =
      PagingController(firstPageKey: 1);
  late List<InvitationModel> invitationData;
  int pageSize = 10;

  void fetchPage(int pageIndex, int fkCity, fkInterest, String rate,
      BuildContext context) async {
    invitationData = await CustomerRepository(context)
        .getInvitationData(pageIndex, fkCity, fkInterest, rate);
    final isLastPage = invitationData.length < pageSize;
    if (isLastPage) {
      pagingController.appendLastPage(invitationData);
    } else {
      final nextPageKey = pageIndex + 1;
      pagingController.appendPage(invitationData, nextPageKey);
    }
  }
}
