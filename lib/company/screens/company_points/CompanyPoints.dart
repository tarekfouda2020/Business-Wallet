part of 'CompanyPointsImports.dart';

class CompanyPoints extends StatefulWidget {
  @override
  _CompanyPointsState createState() => _CompanyPointsState();
}

class _CompanyPointsState extends State<CompanyPoints> {
  final CompanyPointsData companyPointsData = new CompanyPointsData();

  @override
  void initState() {
    companyPointsData.fetchData(context, refresh: false);
    companyPointsData.fetchData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darken,
      appBar: DefaultAppBar(
        title: "تفاصيل النقاط",
      ),
      body: Column(
        children: [
          BuildHeaderTableRow(),
          BlocBuilder<GenericCubit<List<WalletDetailsModel>>,
              GenericState<List<WalletDetailsModel>>>(
            bloc: companyPointsData.walletDetailsCubit,
            builder: (_, state) {
              if (state is GenericUpdateState) {
                if (state.data.isEmpty) {
                  return Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: MyText(
                        title: "لا يوجد تفاصيل",
                        size: 13,
                        color: MyColors.primary,
                      ),
                    ),
                  );
                } else {
                  return Flexible(
                    child: ListView(
                      children: <Widget>[
                        BuildTableRowItem(
                          tableDetails: state.data,
                        ),
                      ],
                    ),
                  );
                }
              } else {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 100),
                  alignment: Alignment.center,
                  child: LoadingDialog.showLoadingView(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
