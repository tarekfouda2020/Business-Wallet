part of 'CompanyMainDetailsImports.dart';

class CompanyMainDetailsData {
  final GenericCubit<int> menuCubit = new GenericCubit(0);

  final GlobalKey<CustomButtonState> btnKey =
      new GlobalKey<CustomButtonState>();
  final GenericCubit<bool> contactDropCubit = new GenericCubit(false);
  final GenericCubit<bool> socialDropCubit = new GenericCubit(false);
  final GenericCubit<bool> imagesDropCubit = new GenericCubit(false);
  final GenericCubit<bool> commentsDropCubit = new GenericCubit(false);
  final GenericCubit<bool> partnersCubit = new GenericCubit(false);
  final GenericCubit<bool> accreditationCubit = new GenericCubit(false);

  final TextEditingController comment = TextEditingController();
  final TextEditingController report = TextEditingController();
  final TextEditingController newComment = TextEditingController();

  final GenericCubit<int> rateCubit = new GenericCubit(0);
  final GenericCubit<File?> imageCubit = new GenericCubit(null);

  final GenericCubit<MainDetailsModel?> mainDetailsCubit =
      new GenericCubit(null);

  void fetchData(BuildContext context, String kayanId,
      {bool refresh = true}) async {
    var data =
        await CompanyRepository(context).getMainDetails(kayanId, refresh);
    mainDetailsCubit.onUpdateData(data);
  }

  void addOrRemoveLike(BuildContext context, String kayanId) async {
    await CompanyRepository(context)
        .addLike(kayanId)
        .then((value) => fetchData(context, kayanId));
  }

  void addOrRemoveFollow(BuildContext context, String kayanId) async {
    await CompanyRepository(context)
        .addFollow(kayanId)
        .then((value) => fetchData(context, kayanId));
  }

  void sendBrochure(BuildContext context, String kayanId) async {
    await CompanyRepository(context)
        .sendBrochure(kayanId)
        .then((value) => fetchData(context, kayanId));
  }

  void addRate(BuildContext context, String kayanId, int rate) async {
    await CompanyRepository(context)
        .addRate(rate, kayanId)
        .then((value) => fetchData(context, kayanId));
  }

  void setImage() async {
    var image = await Utils.getImage();
    if (image != null) {
      imageCubit.onUpdateData(image);
    }
  }

  void deleteImage() {
    imageCubit.onUpdateData(null);
  }

  void addComment(BuildContext context, String kayanId) async {
    await CompanyRepository(context)
        .addComment(kayanId, comment.text, imageCubit.state.data)
        .then((value) {
      comment.clear();
      imageCubit.onUpdateData(null);
      fetchData(context, kayanId);
    });
  }

  void deleteComment(
      BuildContext context, int commentId, String kayanId) async {
    await CompanyRepository(context)
        .deleteComment(commentId)
        .then((value) => fetchData(context, kayanId));
  }

  void editComment(BuildContext context, int commentId, String kayanId) async {
    await CompanyRepository(context)
        .editComment(commentId, newComment.text)
        .then((value) {
      fetchData(context, kayanId);
      newComment.clear();
      AutoRouter.of(context).pop();
    });
  }

  void reportComment(
      BuildContext context, int commentId, String kayanId) async {
    await CompanyRepository(context)
        .reportComment(commentId, kayanId, report.text)
        .then((value) {
      fetchData(context, kayanId);
      report.clear();
      AutoRouter.of(context).pop();
    });
  }
}
