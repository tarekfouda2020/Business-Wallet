part of 'CompanySubscribeImports.dart';

class CompanySubscribe extends StatefulWidget {
  @override
  _CompanySubscribeState createState() => _CompanySubscribeState();
}

class _CompanySubscribeState extends State<CompanySubscribe> {
  final CompanySubscribeData companySubscribeData = new CompanySubscribeData();

  @override
  void initState() {
    super.initState();
    companySubscribeData.controller = new PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      body: PageView(
        controller: companySubscribeData.controller,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: companySubscribeData.subscribeCubit.onUpdateData,
        children: [
          FirstStep(
            subscribeCubit: companySubscribeData.subscribeCubit,
            movePage: companySubscribeData.movePage,
          ),
          SecondStep(
            subscribeCubit: companySubscribeData.subscribeCubit,
            movePage: companySubscribeData.movePage,
          ),
          ThirdStep(
            subscribeCubit: companySubscribeData.subscribeCubit,
            movePage: companySubscribeData.movePage,
          ),
          FourthStep(
            subscribeCubit: companySubscribeData.subscribeCubit,
            movePage: companySubscribeData.movePage,
          ),
        ],
      ),
    );
  }
}
