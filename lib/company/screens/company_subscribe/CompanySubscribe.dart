part of 'CompanySubscribeImports.dart';

class CompanySubscribe extends StatefulWidget {
  final bool showVideo;

  const CompanySubscribe({this.showVideo = true});

  @override
  _CompanySubscribeState createState() => _CompanySubscribeState();
}

class _CompanySubscribeState extends State<CompanySubscribe> {
  final CompanySubscribeData companySubscribeData = new CompanySubscribeData();

  @override
  void initState() {
    super.initState();
    companySubscribeData.duration.text="10";
    companySubscribeData.controller = new PageController(initialPage: 0);
    CompanyRepository(context).getPeopleInterests(refresh: false).then((data) {
      companySubscribeData.interestCubit.onUpdateData(data);
    });
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
            companySubscribeData: companySubscribeData,
            showVideo: widget.showVideo,
          ),
          SecondStep(
            companySubscribeData: companySubscribeData,
            showVideo: widget.showVideo,
          ),
          ThirdStep(
            companySubscribeData: companySubscribeData,
            showVideo: widget.showVideo,
          ),
          FourthStep(
            companySubscribeData: companySubscribeData,
            showVideo: widget.showVideo,
          ),
        ],
      ),
    );
  }
}
