part of'ImportantWidgets.dart';
class Important extends StatefulWidget {
  @override
  _ImportantState createState() => _ImportantState();
}

class _ImportantState extends State<Important> {
  final ImportantData importantData = new ImportantData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        title: "قائمه الاهتمامات",
      ),
      body: BuildImportantPageView(importantData: importantData,),
    );
  }
}
