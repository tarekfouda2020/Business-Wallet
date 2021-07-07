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
    context.read<ChatOnlineCubit>().onUpdateData(true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        backgroundColor: MyColors.darken,
        appBar: PreferredSize(
          child: DefaultAppBar(
            title: widget.receiverName,
            actions: [
              IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 25,
                  color: MyColors.white,
                ),
                onPressed: () {
                  context.read<ChatOnlineCubit>().onUpdateData(false);
                  Navigator.of(context).pop();
                },
              )
            ],
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
      ),
      onWillPop: onChatBack,
    );
  }

  Future<bool> onChatBack() async {
    context.read<ChatOnlineCubit>().onUpdateData(false);
    return true;
  }
}
