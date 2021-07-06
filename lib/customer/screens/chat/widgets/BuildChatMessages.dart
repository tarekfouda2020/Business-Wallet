part of 'ChatWidgetImports.dart';


class BuildChatMessages extends StatelessWidget {
  final ChatData chatsData;
  final String sender;

  const BuildChatMessages({required this.chatsData, required this.sender});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: PagedListView(
        reverse: true,
        padding: const EdgeInsets.symmetric(vertical: 10),
        pagingController: chatsData.pagingController,
        builderDelegate: PagedChildBuilderDelegate<MessageModel>(
          noItemsFoundIndicatorBuilder: (context) =>
              BuildNoItemFound(
                title: tr(context,"noMessages"),
                message: tr(context,"sendFirstMsg"),
              ),
          itemBuilder: (context, item, index) {
            if (sender == item.senderId) {
              return BuildRightMsg(model: item);
            } else {
              return BuildLeftMsg(
                model: item
              );
            }
          },
        ),
      ),
    );
  }
}
