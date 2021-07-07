part of 'ChatWidgetImports.dart';

class BuildChatInput extends StatelessWidget {
  final ChatData chatsData;
  final String receiverId;
  final String senderId;

  const BuildChatInput(
      {required this.chatsData,
      required this.receiverId,
      required this.senderId,
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      color: MyColors.secondary,
      child: ChatTextField(
        controller: chatsData.msgInput,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        hint: "اكتب رسالتك هنا",
        action: TextInputAction.newline,
        submit: () => chatsData.setSendMsg(context, senderId, receiverId),
      ),
    );
  }
}
