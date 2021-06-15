part of 'ConversationImports.dart';

class ConversationData {
  final GenericCubit<List<ConversationModel>> conversationCubit =
      GenericCubit([]);

  void fetchData(BuildContext context) async {
    var data = await CustomerRepository(context).getConversation();
    conversationCubit.onUpdateData(data);
  }
}
