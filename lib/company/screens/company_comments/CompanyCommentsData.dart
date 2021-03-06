part of 'CompanyCommentsImports.dart';

class CompanyCommentsData {
  final GenericCubit<int> rateCubit = new GenericCubit(0);

  final TextEditingController comment = TextEditingController();
  final TextEditingController report = TextEditingController();
  final TextEditingController newComment = TextEditingController();

  final GlobalKey<CustomButtonState> btnKey =
      new GlobalKey<CustomButtonState>();

  final GenericCubit<List<ProfileCommentsModel>> commentsCubit =
      new GenericCubit([]);

  void fetchData(BuildContext context,{bool refresh=true}) async {
    var data = await CompanyRepository(context).getProfileComments(refresh);
    commentsCubit.onUpdateData(data);
  }

  void editComment(BuildContext context, String kayanId, int commentId) async {
    await CompanyRepository(context)
        .editComment(commentId, newComment.text)
        .then((value) {
      rateProfileComment(context, kayanId, rateCubit.state.data);
    });
  }

  void deleteComment(BuildContext context, int commentId) async {
    await CompanyRepository(context).deleteComment(commentId).then((value) {
      fetchData(context);

      AutoRouter.of(context).pop();
    });
  }

  void rateProfileComment(
      BuildContext context, String kayanId, int rate) async {
    await CompanyRepository(context)
        .rateProfileComment(rate, kayanId)
        .then((value) {
      AutoRouter.of(context).pop();
      newComment.clear();
      rateCubit.onUpdateData(0);
      fetchData(context);
    });
  }
}
