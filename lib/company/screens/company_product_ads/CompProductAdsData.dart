part of 'CompProductAdsImports.dart';

class CompProductAdsData {
  final GenericCubit<List<QuestionModel>> allQuestionCubit = GenericCubit([]);
  final GenericCubit<bool> isOwner = new GenericCubit(true);

  final GenericCubit<InvestmentAdsModel?> investmentAdsCubit =
      new GenericCubit(null);

  void fetchData(BuildContext context, int adsId) async {
    var data = await CompanyRepository(context).getInvestmentAds(adsId);
    investmentAdsCubit.onUpdateData(data);
    // isOwner.onUpdateData(data!.investmentAdsDetails.isOwner);

    allQuestionCubit.onUpdateData(data!.questions);
  }

  void onChangeAnswer(BuildContext context, int index, int value, bool isShow) {
    if (isShow == true) {
      value = allQuestionCubit.state.data[index].currentAnswer;
    } else {
      allQuestionCubit.state.data[index].currentAnswer = value;
      allQuestionCubit.onUpdateData(allQuestionCubit.state.data);
    }
  }
}
