part of 'CompAccountReconciliationImports.dart';

class CompAccountReconciliation extends StatefulWidget {
  final double cost;
  final double costMun;

  const CompAccountReconciliation({required this.cost, required this.costMun});

  @override
  _CompAccountReconciliationState createState() =>
      _CompAccountReconciliationState();
}

class _CompAccountReconciliationState extends State<CompAccountReconciliation> {
  final CompAccountReconciliationData compAccountReconciliationData =
      new CompAccountReconciliationData();

  @override
  void initState() {
    compAccountReconciliationData.fetchData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        title: "المحفظة",
      ),
      body: BlocBuilder<GenericCubit<CompFilterReconciliationModel?>,
          GenericState<CompFilterReconciliationModel?>>(
        bloc: compAccountReconciliationData.reconciliationCubit,
        builder: (_, state) {
          if (state is GenericUpdateState) {
            return ListView(
              padding: const EdgeInsets.symmetric(vertical: 20),
              children: [
                BuildPrice(costMun: widget.costMun),
                BuildPersonalInfo(
                  compFilterReconciliationModel: state.data!,
                  compAccountReconciliationData: compAccountReconciliationData,
                ),
                BuildForm(
                    compAccountReconciliationData:
                        compAccountReconciliationData),
                BuildTerms(
                    compAccountReconciliationData:
                        compAccountReconciliationData),
                LoadingButton(
                  btnKey: compAccountReconciliationData.btnKey,
                  title: "تاكيد",
                  onTap: () => compAccountReconciliationData.reconciliationBank(
                    context,
                    widget.cost,
                    widget.costMun,
                  ),
                  color: MyColors.primary,
                  textColor: MyColors.black,
                  borderRadius: 20,
                ),
              ],
            );
          } else {
            return Center(
              child: LoadingDialog.showLoadingView(),
            );
          }
        },
      ),
    );
  }
}
