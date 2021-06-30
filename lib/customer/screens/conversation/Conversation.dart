part of 'ConversationImports.dart';

class Conversation extends StatefulWidget {
  @override
  _ConversationState createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  final ConversationData conversationData = new ConversationData();

  @override
  void initState() {
    conversationData.fetchData(context, refresh: false);
    conversationData.fetchData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        title: "المراسلات",
      ),
      body: BlocBuilder<GenericCubit<List<ConversationModel>>,
          GenericState<List<ConversationModel>>>(
        bloc: conversationData.conversationCubit,
        builder: (_, state) {
          if (state is GenericUpdateState) {
            if (state.data.length > 0) {
              return ListView.builder(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                itemCount: state.data.length,
                itemBuilder: (_, index) => BuildConversationPageView(
                  conversationModel: state.data[index],
                ),
              );
            } else {
              return Center(
                child: MyText(
                  title: "لا يوجد رسائل",
                  size: 15,
                  color: MyColors.primary,
                ),
              );
            }
          } else {
            return Center(
              child: LoadingDialog.showLoadingView(),
            );
          }
        },
      ),
    );
  }
}
