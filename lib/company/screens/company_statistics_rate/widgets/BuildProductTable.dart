part of 'CompStatisticsRateWidgetsImports.dart';

class BuildProductTable extends StatelessWidget {
  final CompanyStatisticsRateData companyStatisticsRateData;

  const BuildProductTable({required this.companyStatisticsRateData});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<ProductAdsDetailsModel?>,
        GenericState<ProductAdsDetailsModel?>>(
      bloc: companyStatisticsRateData.productDetailsCubit,
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
                                padding: const EdgeInsets.symmetric(vertical: 17),
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
                                padding: const EdgeInsets.symmetric(vertical: 17),
                                decoration: BoxDecoration(
                                  border: Border(
                                    right: BorderSide(
                                      color: MyColors.primary.withOpacity(.3),
                                      width: 1,
                                    ),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    MyText(
                                      title: " المنجز : ${state.data!.show} ",
                                      size: 11,
                                      color: MyColors.white,
                                    ),
                                    MyText(
                                      title: " المتبقي : ${state.data!.count}",
                                      size: 11,
                                      color: MyColors.white,
                                    ),
                                  ],
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
                                padding: const EdgeInsets.symmetric(vertical: 17),
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
                                padding: const EdgeInsets.symmetric(vertical: 17),
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

                        ],
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: state.data!.questions.length,
                        itemBuilder: (_,index)=>Table(
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
                                padding: const EdgeInsets.symmetric(vertical: 25),
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
                                  title: "السؤال: ${state.data!.questions[index].name}",
                                  size: 11,
                                  overflow: TextOverflow.ellipsis,
                                  color: MyColors.white,
                                ),
                              ),
                             ListView.builder(
                               shrinkWrap: true,
                               physics: NeverScrollableScrollPhysics(),
                               itemCount: state.data!.questions[index].answers.length,
                               itemBuilder: (_,index)=> Container(
                               padding: const EdgeInsets.symmetric(vertical: 5),

                               decoration: BoxDecoration(
                                 border: Border(
                                   right: BorderSide(
                                     color: MyColors.primary.withOpacity(.3),
                                     width: 1,
                                   ),
                                 ),
                               ),
                               alignment: Alignment.center,
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   MyText(
                                     title: " الاجابة : ${state.data!.questions[0].answers[index].answerName} ",
                                     size: 11,
                                     color: MyColors.white,
                                   ),
                                   MyText(
                                     title: " العدد : ${state.data!.questions[0].answers[index].countAnswer}",
                                     size: 11,
                                     color: MyColors.white,
                                   ),
                                 ],
                               ),
                             ),)
                            ],
                          ),
                        ],
                      ),)
                    ],
                  ),
                ),
                DefaultButton(
                  color: MyColors.primary,
                  textColor: MyColors.blackOpacity,
                  borderRadius: BorderRadius.circular(30),
                  margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                  title: "حفظ كملف PDF",
                  onTap: () => companyStatisticsRateData.savePdf(context,state.data!.id),
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
