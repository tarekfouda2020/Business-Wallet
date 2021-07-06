part of 'ChatImports.dart';

class Chat extends StatefulWidget {
  final String senderId;
  final String receiverId;
  final String receiverName;

  const Chat({
    required this.senderId,
    required this.receiverId,
    required this.receiverName,
  });

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final ChatData chatData = new ChatData();

  @override
  void initState() {
    chatData.pagingController.addPageRequestListener((pageKey) {
      chatData.fetchData(context, widget.senderId, widget.receiverId, pageKey);
    });
    chatData.streamListener(context, mounted, widget.receiverId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: DefaultAppBar(
          title: widget.receiverName,
        ),
        preferredSize: Size.fromHeight(60),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Column(
          children: [
            BuildChatMessages(
              chatsData: chatData,
              sender: widget.senderId,
            ),
            BuildChatInput(
              chatsData: chatData,
              receiverId: widget.receiverId,
              senderId: widget.senderId,
            ),
          ],
        ),
      ),
    );
  }
}
