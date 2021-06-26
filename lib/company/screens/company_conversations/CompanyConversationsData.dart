part of 'CompanyConversationsImports.dart';

class CompanyConversationsData {
  final GenericCubit<List<ConversationModel>> conversationCubit =
      GenericCubit([]);

  void fetchData(BuildContext context) async {
    var data = await CompanyRepository(context).getConversation();
    conversationCubit.onUpdateData(data);
  }
}
