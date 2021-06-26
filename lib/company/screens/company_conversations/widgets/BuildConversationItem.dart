part of 'CompConversationWidgetImports.dart';

class BuildConversationItem extends StatelessWidget {
  final ConversationModel conversationModel;

  const BuildConversationItem({required this.conversationModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
      margin: const EdgeInsets.symmetric(vertical: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: MyColors.greyWhite),
      ),
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
