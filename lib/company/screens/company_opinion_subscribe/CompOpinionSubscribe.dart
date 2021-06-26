part of 'CompOpinionSubscribeImports.dart';

class CompOpinionSubscribe extends StatefulWidget {
  const CompOpinionSubscribe({Key? key}) : super(key: key);

  @override
  _CompOpinionSubscribeState createState() => _CompOpinionSubscribeState();
}

class _CompOpinionSubscribeState extends State<CompOpinionSubscribe> {
  final CompOpinionSubscribeData compOpinionSubscribeData =
      new CompOpinionSubscribeData();

  @override
  void initState() {
    super.initState();
    compOpinionSubscribeData.controller = new PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      body: PageView(
        controller: compOpinionSubscribeData.controller,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: compOpinionSubscribeData.subscribeCubit.onUpdateData,
        children: [
          FirstStepOpinion(

          ),
          SecondStepOpinion(
         ),
          ThirdStepOpinion(
         ),

        ],
      ),
    );
  }
}
