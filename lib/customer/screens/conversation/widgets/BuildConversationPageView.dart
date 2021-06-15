part of 'ConversationWidgetsImports.dart';

class BuildConversationPageView extends StatelessWidget {
  final ConversationModel conversationModel;

  const BuildConversationPageView({required this.conversationModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: MyColors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        children: [
          CachedImage(
            url: conversationModel.img,
            haveRadius: false,
            width: 55,
            height: 55,
            borderColor: MyColors.white,
            boxShape: BoxShape.circle,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                      title: conversationModel.userName,
                      size: 10,
                      color: MyColors.white,
                    ),
                    MyText(
                      title: conversationModel.date,
                      size: 10,
                      color: MyColors.greyWhite.withOpacity(0.7),
                    ),
                  ],
                ),
                MyText(
                  title: conversationModel.lastMsg,
                  size: 10,
                  color: MyColors.greyWhite.withOpacity(0.7),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
