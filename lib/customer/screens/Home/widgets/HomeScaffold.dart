part of 'HomeWidgetsImports.dart';

class HomeScaffold extends StatelessWidget {
  final String ?title;
  final Widget search;
  final Widget body;
  final Function() ?searchOnTap;
  final GlobalKey<ScaffoldState> scaffold;
  const HomeScaffold({this.title, required this.search, required this.body, this.searchOnTap, required this.scaffold});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffold,
      backgroundColor: MyColors.darken,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: BuildMainHeader(
          title: title,
          search: search,
          searchOnTap: searchOnTap,
        ),
      ),
      body: body,
    );
  }
}
