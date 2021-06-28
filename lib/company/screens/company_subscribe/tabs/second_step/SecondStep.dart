part of 'SecondStepImports.dart';

class SecondStep extends StatefulWidget {
  final CompanySubscribeData companySubscribeData;
  final bool showVideo;

  SecondStep({required this.companySubscribeData, required this.showVideo});

  @override
  _SecondStepState createState() => _SecondStepState();
}

class _SecondStepState extends State<SecondStep> {
  final SecondStepData secondStepData = new SecondStepData();

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
            step2: true,
          ),
          BuildSecForm(companySubscribeData: widget.companySubscribeData),
          BuildPrice(companySubscribeData: widget.companySubscribeData),
          BuildAdsValue(companySubscribeData: widget.companySubscribeData),
          LoadingButton(
            btnKey: widget.companySubscribeData.btnKey,
            color: MyColors.primary,
            textColor: MyColors.blackOpacity,
            borderRadius: 30,
            title: "التالي",
            onTap: () => widget.companySubscribeData.getFinalCostSubscribe(context),
          ),
          DefaultButton(
            color: MyColors.white,
            textColor: MyColors.primary,
            borderRadius: BorderRadius.circular(30),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            title: "السابق",
            onTap: () => widget.companySubscribeData.moveBack(),
          )
        ],
      ),
    );
  }
}
