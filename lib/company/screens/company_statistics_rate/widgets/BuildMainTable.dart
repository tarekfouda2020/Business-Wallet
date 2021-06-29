part of 'CompStatisticsRateWidgetsImports.dart';

class BuildMainTable extends StatelessWidget {
  final CompanyStatisticsRateData companyStatisticsRateData;

  const BuildMainTable({required this.companyStatisticsRateData});

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
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 15),
                                decoration: BoxDecoration(
                                  border: Border(
                                    left: BorderSide(
                                      color: MyColors.primary.withOpacity(.3),
                                      width: 1,
                                    ),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: MyText(
                                  title: state.data!.date,
                                  size: 11,
                                  overflow: TextOverflow.ellipsis,
                                  color: MyColors.white,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 15),
                                decoration: BoxDecoration(
                                  border: Border(
                                    right: BorderSide(
                                      color: MyColors.primary.withOpacity(.3),
                                      width: 1,
                                    ),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: MyText(
                                  title:
                                  state.data!.cost.toString(),
                                  size: 11,
                                  color: MyColors.white,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 15),
                                decoration: BoxDecoration(
                                  border: Border(
                                    right: BorderSide(
                                      color: MyColors.primary.withOpacity(.3),
                                      width: 1,
                                    ),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: MyText(
                                  title:
                                  state.data!.countShow.toString(),
                                  size: 11,
                                  color: MyColors.white,
                                ),
                              ),
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
                      companyStatisticsRateData.savePdf(context, state.data!.id),
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
