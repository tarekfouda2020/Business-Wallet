part of 'CompStatisticsRateWidgetsImports.dart';

class BuildSpecificTable extends StatelessWidget {
  final CompanyStatisticsRateData companyStatisticsRateData;

  const BuildSpecificTable({required this.companyStatisticsRateData});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<SpecificAdsDetailsModel?>,
        GenericState<SpecificAdsDetailsModel?>>(
      bloc: companyStatisticsRateData.specificDetailsCubit,
      builder: (_, state) {
        if (state is GenericUpdateState) {
          return Flexible(
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
                            title: "عدد الزيارات",
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
                                "المنجز ${state.data!.show} المتبقي ${state.data!.count}",
                            size: 11,
                            color: MyColors.white,
                          ),
                        ),
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
                            title: "تاريخ البداية",
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
                            title: state.data!.date,
                            size: 11,
                            color: MyColors.white,
                          ),
                        ),
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
                            title: "مشاركة الاعلان",
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
                            title: state.data!.adsCountShare.toString(),
                            size: 11,
                            color: MyColors.white,
                          ),
                        ),
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
                            title: "المفضلة",
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
                            title: state.data!.fav.toString(),
                            size: 11,
                            color: MyColors.white,
                          ),
                        ),
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
                            title: "التقييم",
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
                            title: state.data!.rate.toString(),
                            size: 11,
                            color: MyColors.white,
                          ),
                        ),
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
                            title: "اعجبني",
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
                            title: state.data!.like.toString(),
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
