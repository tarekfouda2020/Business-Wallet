part of 'FirstStepImports.dart';

class FirstStep extends StatefulWidget {
  final CompanySubscribeData companySubscribeData;
  final bool showVideo;

  FirstStep({required this.companySubscribeData, this.showVideo = true});

  @override
  _FirstStepState createState() => _FirstStepState();
}

class _FirstStepState extends State<FirstStep> {
  late FirstStepData firstStepData;


  @override
  void initState() {
    firstStepData=widget.companySubscribeData.firstStepData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        title: "اعلان مرسل لفئة محدودة من العملاء",
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        children: [
          BuildStepper(
            step1: true,
          ),
          BuildForm(
            companySubscribeData: widget.companySubscribeData,
            showVideo: widget.showVideo,
          ),
          DefaultButton(
            color: MyColors.primary,
            textColor: MyColors.blackOpacity,
            borderRadius: BorderRadius.circular(30),
            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            title: "التالي",
            onTap: () => widget.companySubscribeData.onSubscribe(context),
          ),
        ],
      ),
    );
  }
}
