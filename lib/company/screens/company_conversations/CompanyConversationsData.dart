part of 'CompanyConversationsImports.dart';

class CompanyConversationsData {
  final GenericCubit<List<ConversationModel>> conversationCubit =
      GenericCubit([]);

  void fetchData(BuildContext context,{bool refresh=true}) async {
    var data = await CompanyRepository(context).getConversation(refresh);
    conversationCubit.onUpdateData(data);
  }
}
