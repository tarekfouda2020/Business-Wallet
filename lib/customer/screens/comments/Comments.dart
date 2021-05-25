part of 'CommentsImports.dart';

class Comments extends StatefulWidget {
  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        title: "التعليقات",
      ),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, state){
          return BuildCommentsPageView(
            title: "new",
            text: "AutoCode",
          );
        },
      ),
    );
  }
}
