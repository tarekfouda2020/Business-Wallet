part of 'FourthStepImports.dart';

class FourthStep extends StatefulWidget {
  final CompanySubscribeData companySubscribeData;
  final bool showVideo;

  FourthStep({required this.companySubscribeData, required this.showVideo});

  @override
  _FourthStepState createState() => _FourthStepState();
}

class _FourthStepState extends State<FourthStep> {
  late FourthStepData fourthStepData;

  @override
  void initState() {
    fourthStepData = widget.companySubscribeData.fourthStepData;
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
            step4: true,
          ),
          BuildPaymentText(widget.companySubscribeData),
          // BlocBuilder<GenericCubit, GenericState>(
          //   bloc: fourthStepData.paymentCubit,
          //   builder: (context, state) {
          //     return Column(
          //       children: [
          //         BuildPaymentItem(
          //           title: "الدفع ماستر كارد/ فيزا ",
          //           value: 0,
          //           selected: state.data,
          //           onChange: fourthStepData.paymentCubit.onUpdateData,
          //         ),
          //         BuildPaymentItem(
          //           title: "الدفع مدي",
          //           value: 1,
          //           selected: state.data,
          //           onChange: fourthStepData.paymentCubit.onUpdateData,
          //         ),
          //         // BuildPaymentItem(
          //         //   title: "fdfdfd",
          //         //   value: 2,
          //         //   selected: state.data,
          //         //   onChange: fourthStepData.paymentCubit.onUpdateData,
          //         // ),
          //       ],
          //     );
          //   },
          // ),
          DefaultButton(
            color: MyColors.primary,
            textColor: MyColors.blackOpacity,
            borderRadius: BorderRadius.circular(30),
            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            title: "دفع",
            onTap: () => widget.companySubscribeData.navToPayment(
                userId: widget.companySubscribeData.addSubscribeModel.userId
                    .toString(),
                cost: widget.companySubscribeData.addSubscribeModel.price
                    .toString(),
                type: 1,
                advertId:
                    widget.companySubscribeData.idCubit.state.data.toString(),
                context: context),
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
