part of 'FavoriteDetailsImports.dart';

class FavoriteDetailsData {
  List<Map<String, String>> answers = [{}];
  final GlobalKey<CustomButtonState> btnKey =
      new GlobalKey<CustomButtonState>();

  final GenericCubit<bool> showDescriptionDrop = GenericCubit(false);

  final GenericCubit<List<QuestionModel>> allQuestionCubit = GenericCubit([]);

  final GenericCubit<InvestmentAdsModel?> investmentAdsCubit =
      new GenericCubit(null);

  void fetchData(BuildContext context, int adsId) async {
    var data = await CustomerRepository(context).getInvestmentAds(adsId);
    investmentAdsCubit.onUpdateData(data);
    allQuestionCubit.onUpdateData(data!.questions);
  }

  void answerQuestion(BuildContext context, int adsId) async {
    answers = allQuestionCubit.state.data
        .where((element) => element.currentAnswer != 0)
        .map((e) => {
              "question_Id": "${e.questionId}",
              "answer_Id": "${e.currentAnswer}"
            })
        .toList();
    btnKey.currentState!.animateForward();

    await CustomerRepository(context)
        .answerQuestion(json.encode(answers), adsId)
        .then((value) => updateInvestmentAds(context, adsId));
    btnKey.currentState!.animateReverse();
  }

  void updateInvestmentAds(BuildContext context, int adsId) async {
    await CustomerRepository(context)
        .updateInvestmentAds(adsId)
        .then((value) => getInvestmentAdsPoint(context, adsId));
  }

  void getInvestmentAdsPoint(BuildContext context, int adsId) async {
    await CustomerRepository(context)
        .getSpecificAdsPoint(
            "0",
            investmentAdsCubit
                .state.data!.investmentAdsDetails.pintsForEachUser,
            adsId,
            "2")
        .then((value) => fetchData(context, adsId));
  }

  void addOrRemoveFollow(
      BuildContext context, String kayanId, int adsId) async {
    await CustomerRepository(context)
        .addFollow(kayanId)
        .then((value) => fetchData(context, adsId));
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
