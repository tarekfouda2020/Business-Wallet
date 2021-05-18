part of 'HomeWidgetsImports.dart';

class HomeScaffold extends StatelessWidget {
  final String ?title;
  final Widget search;
  final Widget body;
  const HomeScaffold({this.title, required this.search, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: BuildMainHeader(
          title: title,
          search: search,
        ),
      ),
      body: body,
    );
  }
}
