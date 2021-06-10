part of 'ProviderDetailsImports.dart';

class ProviderDetailsData {
  // final GlobalKey btnKey = new GlobalKey();

  final GlobalKey<CustomButtonState> btnKey =
      new GlobalKey<CustomButtonState>();

  final GenericCubit<File?> imageCubit = new GenericCubit(null);
  final GenericCubit<bool> contactCubit = GenericCubit(false);
  final GenericCubit<bool> socialCubit = GenericCubit(false);
  final GenericCubit<bool> photosCubit = GenericCubit(false);
  final GenericCubit<bool> commentsCubit = GenericCubit(false);
  final TextEditingController comment = TextEditingController();
  final TextEditingController report = TextEditingController();
  final TextEditingController newComment = TextEditingController();

  final GenericCubit<int> rateCubit = new GenericCubit(0);

  final GenericCubit<MainDetailsModel?> mainDetailsCubit =
      new GenericCubit(null);

  void fetchData(BuildContext context, String kayanId) async {
    var data = await CustomerRepository(context).getMainDetails(kayanId);
    mainDetailsCubit.onUpdateData(data);
  }

  void addOrRemoveLike(BuildContext context, String kayanId) async {
    await CustomerRepository(context)
        .addLike(kayanId)
        .then((value) => fetchData(context, kayanId));
  }

  void addOrRemoveFollow(BuildContext context, String kayanId) async {
    await CustomerRepository(context)
        .addFollow(kayanId)
        .then((value) => fetchData(context, kayanId));
  }

  void addRate(BuildContext context, String kayanId,int rate) async {
    await CustomerRepository(context)
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
    await CustomerRepository(context)
        .addComment(kayanId, comment.text, imageCubit.state.data)
        .then((value) {
      comment.clear();
      imageCubit.onUpdateData(null);
      fetchData(context, kayanId);
    });
  }

  void deleteComment(BuildContext context, int commentId) async {
    await CustomerRepository(context)
        .deleteComment(commentId)
        .then((value) => AutoRouter.of(context).pop());
  }

  void editComment(BuildContext context, int commentId) async {
    await CustomerRepository(context)
        .editComment(commentId, newComment.text)
        .then((value) => AutoRouter.of(context).pop());
  }

  void reportComment(
      BuildContext context, int commentId, String kayanId) async {
    await CustomerRepository(context)
        .reportComment(commentId, kayanId, report.text)
        .then((value) => AutoRouter.of(context).pop());
  }

  late final SpearMenu menu;

  void initMenu(BuildContext context) {
    List<MenuItemProvider> setData = <MenuItemProvider>[];
    setData.add(MenuItem(title: "ابلاغ", isActive: false));
    setData.add(MenuItem(title: "مسح", isActive: false));

    menu = SpearMenu(
      items: setData,
      context: context,
      onClickMenu: (item) => onClickMenu(item, context),
    );
  }

  void onClickMenu(MenuItemProvider item, BuildContext context) async {
    if (item.menuTitle == "ابلاغ") {
      // CustomerRepository(context).reportComment(commentId);
    } else {
      // CustomerRepository(context).deleteComment(commentId);
    }
    print('______ ${item.menuTitle}');
  }
}
