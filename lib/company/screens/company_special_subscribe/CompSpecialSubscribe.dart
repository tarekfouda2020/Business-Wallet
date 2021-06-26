part of 'CompSpecialSubscribeImports.dart';

class CompSpecialSubscribe extends StatefulWidget {
  @override
  _CompSpecialSubscribeState createState() => _CompSpecialSubscribeState();
}

class _CompSpecialSubscribeState extends State<CompSpecialSubscribe> {
  final CompSpecialSubscribeData compSpecialSubscribeData =
      new CompSpecialSubscribeData();

  @override
  void initState() {
    super.initState();
    compSpecialSubscribeData.controller = new PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      body: PageView(
        controller: compSpecialSubscribeData.controller,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: compSpecialSubscribeData.subscribeCubit.onUpdateData,
        children: [
          FirstStepSpecial(),
          SecondStepSpecial(),
          ThirdStepSpecial(),
          FourthStepSpecial(),
        ],
      ),
    );
  }
}
