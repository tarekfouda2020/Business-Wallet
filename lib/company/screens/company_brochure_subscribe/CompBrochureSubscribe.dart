part of 'CompBrochureSubscribeImports.dart';

class CompBrochureSubscribe extends StatefulWidget {
  const CompBrochureSubscribe({Key? key}) : super(key: key);

  @override
  _CompBrochureSubscribeState createState() => _CompBrochureSubscribeState();
}

class _CompBrochureSubscribeState extends State<CompBrochureSubscribe> {
  final CompBrochureSubscribeData compBrochureSubscribeData =
      new CompBrochureSubscribeData();

  @override
  void initState() {
    super.initState();
    compBrochureSubscribeData.controller = new PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      body: PageView(
        controller: compBrochureSubscribeData.controller,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: compBrochureSubscribeData.subscribeCubit.onUpdateData,
        children: [
          FirstStepBrochure(),
          SecondStepBrochure(),
          ThirdStepBrochure(),
        ],
      ),
    );
  }
}
