part of 'CompanyConversationsImports.dart';

class CompanyConversations extends StatefulWidget {
  @override
  _CompanyConversationsState createState() => _CompanyConversationsState();
}

class _CompanyConversationsState extends State<CompanyConversations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        title: "المراسلات",
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        itemCount: 4,
        itemBuilder: (_, index) => BuildConversationItem(),
      ),
    );
  }
}
