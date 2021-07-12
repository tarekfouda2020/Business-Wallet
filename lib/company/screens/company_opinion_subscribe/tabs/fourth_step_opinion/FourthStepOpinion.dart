part of 'FourthStepOpinionImports.dart';

class FourthStepOpinion extends StatefulWidget {
  final CompOpinionSubscribeData compOpinionSubscribeData;

  const FourthStepOpinion({required this.compOpinionSubscribeData});

  @override
  _FourthStepOpinionState createState() => _FourthStepOpinionState();
}

class _FourthStepOpinionState extends State<FourthStepOpinion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        title: "باقة استطلاع رأي",
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        children: [
          BuildStepper(
            step4: true,
          ),
          BuildPriceView(
              compOpinionSubscribeData: widget.compOpinionSubscribeData),
          DefaultButton(
            color: MyColors.primary,
            textColor: MyColors.blackOpacity,
            borderRadius: BorderRadius.circular(30),
            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            title: "دفع",
            onTap: () => widget.compOpinionSubscribeData.navToPayment(
                userId: widget
                    .compOpinionSubscribeData.addOpinionSubscribeModel.userId
                    .toString(),
                cost: widget
                    .compOpinionSubscribeData.addOpinionSubscribeModel.price
                    .toString(),
                type: 3,
                advertId: widget.compOpinionSubscribeData.idCubit.state.data
                    .toString(),
                context: context),
          ),
          DefaultButton(
            color: MyColors.primary,
            textColor: MyColors.blackOpacity,
            borderRadius: BorderRadius.circular(30),
            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            title: "السابق",
            onTap: () => Navigator.of(context).pop(),
          )
        ],
      ),
    );
  }
}
