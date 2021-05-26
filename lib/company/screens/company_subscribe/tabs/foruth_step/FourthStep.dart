part of 'FourthStepImports.dart';

class FourthStep extends StatefulWidget {
  final GenericCubit subscribeCubit;
  final Function(int page) movePage;

  FourthStep({required this.subscribeCubit, required this.movePage});

  @override
  _FourthStepState createState() => _FourthStepState();
}

class _FourthStepState extends State<FourthStep> {
  final FourthStepData fourthStepData = new FourthStepData();

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
            movePage: widget.movePage,
          ),
          BuildPaymentText(),
          BlocBuilder<GenericCubit, GenericState>(
            bloc: fourthStepData.paymentCubit,
            builder: (context, state) {
              return Column(
                children: [
                  BuildPaymentItem(
                    title: "fdfdfd",
                    value: 0,
                    selected: state.data,
                    onChange: fourthStepData.paymentCubit.onUpdateData,
                  ),
                  BuildPaymentItem(
                    title: "fdfdfd",
                    value: 1,
                    selected: state.data,
                    onChange: fourthStepData.paymentCubit.onUpdateData,
                  ),
                  BuildPaymentItem(
                    title: "fdfdfd",
                    value: 2,
                    selected: state.data,
                    onChange: fourthStepData.paymentCubit.onUpdateData,
                  ),
                ],
              );
            },
          ),
          DefaultButton(
            color: MyColors.primary,
            textColor: MyColors.blackOpacity,
            borderRadius: BorderRadius.circular(30),
            margin: const EdgeInsets.symmetric(vertical: 30,horizontal: 10),
            title: "تأكيد",
            onTap: () => widget.movePage(3),
          )
        ],
      ),
    );
  }
}
