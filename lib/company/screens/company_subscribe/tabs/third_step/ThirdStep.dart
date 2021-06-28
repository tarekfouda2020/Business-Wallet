part of 'ThirdStepImports.dart';

class ThirdStep extends StatefulWidget {
  final CompanySubscribeData companySubscribeData;
  final bool showVideo;

  ThirdStep({required this.companySubscribeData, required this.showVideo});

  @override
  _ThirdStepState createState() => _ThirdStepState();
}

class _ThirdStepState extends State<ThirdStep> {
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
            step3: true,
          ),
          BuildReviewPrice(
            companySubscribeData: widget.companySubscribeData,
          ),
          BuildDetails(
            companySubscribeData: widget.companySubscribeData,
            showVideo: widget.showVideo,
          ),
          BuildButtonList(
            companySubscribeData: widget.companySubscribeData,
          )
        ],
      ),
    );
  }
}
