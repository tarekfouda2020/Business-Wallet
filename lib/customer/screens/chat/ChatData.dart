part of 'ChatImports.dart';


class ChatData{

  final TextEditingController msgInput = new TextEditingController();
  final GlobalNotification globalNotification = new GlobalNotification();

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

  void streamListener(BuildContext context, mounted,String receiver) {
    if (!mounted) {
      globalNotification.notificationSubject.stream.listen((RemoteMessage message) {
        String senderId = "${message.data["sender_id"]}";
        String receiverId = "${message.data["reciver_id"]}";
        String text = "${message.data["msg"]}";
        String date = "${message.data["date"]}";
        if (receiver!=senderId) {
          GlobalNotification.showLocalNotification(message);
        }else{
          chatList.insert(0, MessageModel(senderId: receiverId,date: date,text: text));
          pagingController.itemList = [];
          pagingController.itemList = chatList;
        }
      });
    }
  }

  setSendMsg(BuildContext context,String sender,String receiver)async{
    if(msgInput.text.trim().isEmpty)return;
    var result = await CustomerRepository(context).sendMessage(sender, receiver,msgInput.text);
    if (result) {
      String date = DateFormat("hh:mm a").format(DateTime.now());
      chatList.insert(0, MessageModel(senderId: sender,date: date,text: msgInput.text));
      pagingController.itemList = [];
      pagingController.itemList = chatList;
    }
  }

}
