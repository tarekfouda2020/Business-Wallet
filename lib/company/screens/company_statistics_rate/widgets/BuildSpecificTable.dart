part of 'CompStatisticsRateWidgetsImports.dart';

class BuildSpecificTable extends StatelessWidget {
  final CompanyStatisticsRateData companyStatisticsRateData;
  final int type;

  const BuildSpecificTable(
      {required this.companyStatisticsRateData, required this.type});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<SpecificAdsDetailsModel?>,
        GenericState<SpecificAdsDetailsModel?>>(
      bloc: companyStatisticsRateData.specificDetailsCubit,
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
                              BuildTableRightItem(title: "عدد الزيارات"),
                              BuildTableLeftItem(
                                title: " المنجز : ${state.data!.show} ",
                                desc: " المتبقي : ${state.data!.count}",
                              )
                            ],
                          ),
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
                              BuildTableRightItem(title: "تاريخ البداية"),
                              BuildTableLeftItem(
                                title: state.data!.date,
                              )
                            ],
                          ),
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
                              BuildTableRightItem(title: "مشاركة الاعلان"),
                              BuildTableLeftItem(
                                title: state.data!.adsCountShare.toString(),
                              )
                            ],
                          ),
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
                              BuildTableRightItem(
                                title: "المفضلة",
                              ),
                              BuildTableLeftItem(
                                title: state.data!.fav.toString(),
                              )
                            ],
                          ),
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
                              BuildTableRightItem(
                                title: "التقييم",
                              ),
                              BuildTableLeftItem(
                                title: state.data!.rate.toString(),
                              )
                            ],
                          ),
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
                              BuildTableRightItem(
                                title: "اعجبني",
                              ),
                              BuildTableLeftItem(
                                title: state.data!.like.toString(),
                              )
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
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  title: "حفظ كملف PDF",
                  onTap: () => companyStatisticsRateData.savePdfs(
                      context, state.data!.id, type),
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
