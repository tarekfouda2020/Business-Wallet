part of'AppInfoImports.dart';
class AppInfo extends StatefulWidget {
  @override
  _AppInfoState createState() => _AppInfoState();
}

class _AppInfoState extends State<AppInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        title: "معلومات التطبيق",
      ),
      body: BuildAppInfoPageView(),
    );
  }
}
