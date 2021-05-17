part of 'MainPageImports.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: BuildMainHeader(),
      ),
      body: Column(
        children: [
          BuildChangeView(),
          BuildMainPageView()
        ],
      ),
    );
  }
}
