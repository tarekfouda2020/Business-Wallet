part of 'CompanyConversationsImports.dart';

class CompanyConversations extends StatefulWidget {
  @override
  _CompanyConversationsState createState() => _CompanyConversationsState();
}

class _CompanyConversationsState extends State<CompanyConversations> {
  final CompanyConversationsData companyConversationsData =
      new CompanyConversationsData();

  @override
  void initState() {
    companyConversationsData.fetchData(context);
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
        bloc: companyConversationsData.conversationCubit,
        builder: (_, state) {
          if (state is GenericUpdateState) {
            if (state.data.length > 0) {
              return ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                itemCount: state.data.length,
                itemBuilder: (_, index) => BuildConversationItem(
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
