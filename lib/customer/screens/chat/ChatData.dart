part of 'ChatImports.dart';

class ChatData{

  final TextEditingController msgInput = new TextEditingController();
  final TextEditingController report = new TextEditingController();

  List<MessageModel> chatList = [];

  int pageSize = 10;

  final PagingController<int, MessageModel> pagingController =
  PagingController(firstPageKey: 1);

  fetchData(BuildContext context, String sender , String receiver, int pageNumber) async {
    var data =
    await CustomerRepository(context).getChatMessages(sender, receiver, pageNumber);
    final isLastPage = data.length < pageSize;
    if (isLastPage) {
      var lst = data.reversed.toList();
      pagingController.appendLastPage(lst);
      chatList.addAll(lst);
    } else {
      final nextPageKey = pageNumber + 1;
      var lst = data.reversed.toList();
      pagingController.appendPage(lst, nextPageKey);
      chatList.addAll(lst);
    }
  }

}