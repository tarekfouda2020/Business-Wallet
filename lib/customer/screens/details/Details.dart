part of'DetailsImports.dart';
class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        title: "تفاصيل النقاط",
      ),
      body: Center(
        child: MyText(
          title: "لا توجد تفاصيل",
        ),
      ),
    );
  }
}
