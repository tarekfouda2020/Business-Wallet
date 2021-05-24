part of 'CompanyCommentsImports.dart';

class CompanyComments extends StatefulWidget {
  @override
  _CompanyCommentsState createState() => _CompanyCommentsState();
}

class _CompanyCommentsState extends State<CompanyComments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        title: "التعليقات",
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        itemCount: 4,
        itemBuilder: (_, index) => BuildCommentItem(),
      ),
    );
  }
}
