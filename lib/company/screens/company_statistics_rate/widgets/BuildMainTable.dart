part of 'CompStatisticsRateWidgetsImports.dart';

class BuildMainTable extends StatelessWidget {
  final CompanyStatisticsRateData companyStatisticsRateData;
  final int type;

  const BuildMainTable({required this.companyStatisticsRateData,required this.type});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<BusinessAdsDetailsModel?>,
        GenericState<BusinessAdsDetailsModel?>>(
      bloc: companyStatisticsRateData.mainDetailsCubit,
      builder: (_, state) {
        if (state is GenericUpdateState) {
          return Flexible(
            child: Column(
              children: [
                Flexible(
                  child: ListView(
                    children: <Widget>[
                      Table(
                        children: [
                          TableRow(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: MyColors.primary.withOpacity(.3),
                                  width: 1,
                                ),
                              ),
                            ),
                            children: [
                              BuildTableRightItem(title:  state.data!.date,),
                              BuildTableRightItem(title: state.data!.cost.toString(),),
                              BuildTableRightItem(title:    state.data!.countShow.toString(),),

                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                DefaultButton(
                  color: MyColors.primary,
                  textColor: MyColors.blackOpacity,
                  borderRadius: BorderRadius.circular(30),
                  margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                  title: "حفظ كملف PDF",
                  onTap: () =>
                      companyStatisticsRateData.savePdfs(context, state.data!.id,type),
                ),
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
    );
  }
}
