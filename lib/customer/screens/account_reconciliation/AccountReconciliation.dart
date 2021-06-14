part of 'AccountReconciliationImports.dart';

class AccountReconciliation extends StatefulWidget {
  final double cost;
  final double costMun;

  const AccountReconciliation({required this.cost, required this.costMun});

  @override
  _AccountReconciliationState createState() => _AccountReconciliationState();
}

class _AccountReconciliationState extends State<AccountReconciliation> {
  final AccountReconciliationData accountReconciliationData =
      new AccountReconciliationData();

  @override
  void initState() {
    accountReconciliationData.fetchData(context, widget.cost, widget.costMun);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        title: "المحفظة",
      ),
      body: BlocBuilder<GenericCubit<ReconciliationDataModel?>,
          GenericState<ReconciliationDataModel?>>(
        bloc: accountReconciliationData.reconciliationCubit,
        builder: (_, state) {
          if (state is GenericUpdateState) {
            return ListView(
              padding: const EdgeInsets.symmetric(vertical: 20),
              children: [
                BuildPrice(costMun: state.data!.costMun),
                BuildPersonalInfo(reconciliationDataModel: state.data!),
                BuildForm(accountReconciliationData: accountReconciliationData),
                BuildTerms(
                    accountReconciliationData: accountReconciliationData),
                LoadingButton(
                  btnKey: accountReconciliationData.btnKey,
                  title: "تاكيد",
                  onTap: () => accountReconciliationData.reconciliationBank(
                      context, widget.cost, widget.costMun),
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
