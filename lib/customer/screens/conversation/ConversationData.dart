part of 'ConversationImports.dart';

class ConversationData {
  final GenericCubit<List<ConversationModel>> conversationCubit =
      GenericCubit([]);

  void fetchData(BuildContext context,{bool refresh=true}) async {
    var data = await CustomerRepository(context).getConversation(refresh);
    conversationCubit.onUpdateData(data);
  }
}
