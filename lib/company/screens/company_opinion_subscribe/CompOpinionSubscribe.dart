part of 'CompOpinionSubscribeImports.dart';

class CompOpinionSubscribe extends StatefulWidget {
  @override
  _CompOpinionSubscribeState createState() => _CompOpinionSubscribeState();
}

class _CompOpinionSubscribeState extends State<CompOpinionSubscribe> {
  final CompOpinionSubscribeData compOpinionSubscribeData =
      new CompOpinionSubscribeData();

  @override
  void initState() {
    super.initState();
    compOpinionSubscribeData.duration.text="10";
    compOpinionSubscribeData.controller = new PageController(initialPage: 0);
    CompanyRepository(context).getPeopleInterests(refresh: false).then((data) {
      compOpinionSubscribeData.interestCubit.onUpdateData(data);
    });
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
            compOpinionSubscribeData: compOpinionSubscribeData,
          ),
          SecondStepOpinion(
            compOpinionSubscribeData: compOpinionSubscribeData,
          ),
          ThirdStepOpinion(
            compOpinionSubscribeData: compOpinionSubscribeData,
          ),
          FourthStepOpinion(
            compOpinionSubscribeData: compOpinionSubscribeData,
          )
        ],
      ),
    );
  }
}
