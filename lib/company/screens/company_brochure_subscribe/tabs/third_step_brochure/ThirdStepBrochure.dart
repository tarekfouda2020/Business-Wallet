part of 'ThirdStepBrochureImports.dart';

class ThirdStepBrochure extends StatefulWidget {
  final CompBrochureSubscribeData compBrochureSubscribeData;

  const ThirdStepBrochure({required this.compBrochureSubscribeData});

  @override
  _ThirdStepBrochureState createState() => _ThirdStepBrochureState();
}

class _ThirdStepBrochureState extends State<ThirdStepBrochure> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        title: "باقة بروشور",
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        children: [
          BuildStepper(
            step3: true,
          ),
          BuildReviewPrice(
            compBrochureSubscribeData: widget.compBrochureSubscribeData,
          ),
          DefaultButton(
            color: MyColors.primary,
            textColor: MyColors.blackOpacity,
            borderRadius: BorderRadius.circular(30),
            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            title: "دفع",
            onTap: () => widget.compBrochureSubscribeData.navToPayment(
                userId:
                    context.read<UserCubit>().state.model.companyModel!.userId,
                cost: widget.compBrochureSubscribeData.finalCostCubit.state.data
                    .toString(),
                type: 4,
                advertId: widget.compBrochureSubscribeData.idCubit.state.data
                    .toString(),
                context: context),
          ),
          DefaultButton(
            color: MyColors.white,
            textColor: MyColors.primary,
            borderRadius: BorderRadius.circular(30),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            title: "السابق",
            onTap: () => widget.compBrochureSubscribeData.moveBack(),
          )
        ],
      ),
    );
  }
}
