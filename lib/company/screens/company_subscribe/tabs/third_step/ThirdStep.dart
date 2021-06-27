part of 'ThirdStepImports.dart';

class ThirdStep extends StatefulWidget {
  final CompanySubscribeData companySubscribeData;

  ThirdStep({required this.companySubscribeData});

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
          ),
          DefaultButton(
            color: MyColors.white,
            textColor: MyColors.blackOpacity,
            borderRadius: BorderRadius.circular(30),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            title: "حفظ كملف PDF",
            onTap: () => widget.companySubscribeData.savePdf(context),
          ),
          DefaultButton(
            color: MyColors.primary,
            textColor: MyColors.blackOpacity,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            borderRadius: BorderRadius.circular(30),
            title: "التالي",
            onTap: () => widget.companySubscribeData.moveNext(),
          ),
          DefaultButton(
            color: MyColors.white,
            textColor: MyColors.blackOpacity,
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
