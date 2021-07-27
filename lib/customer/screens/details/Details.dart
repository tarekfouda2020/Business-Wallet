part of 'DetailsImports.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final DetailsData detailsData = new DetailsData();

  @override
  void initState() {
    detailsData.fetchData(context, refresh: false);

    detailsData.fetchData(context);
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
            bloc: detailsData.walletDetailsCubit,
            builder: (_, state) {
              if (state is GenericUpdateState) {
                if (state.data.length > 0) {
                  return Flexible(
                    child: ListView(
                      children: <Widget>[
                        BuildTableRowItem(
                          tableDetails: state.data,
                        ),
                      ],
                    ),
                  );
                } else {
                  return Expanded(
                    child: Center(
                      child: MyText(
                        title: "لا يوجد تفاصيل",
                        color: MyColors.primary,
                        size: 13,
                      ),
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
