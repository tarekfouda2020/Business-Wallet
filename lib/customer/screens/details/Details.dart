part of 'DetailsImports.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final DetailsData detailsData = new DetailsData();

  @override
  void initState() {
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
                return Flexible(
                  child: ListView(
                    children: <Widget>[
                      BuildTableRowItem(tableDetails: state.data,),
                    ],
                  ),
                );
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
