part of 'CompanyProfileImport.dart';

class CompanyProfileData {

  final GlobalKey<CustomButtonState> btnKey =
  new GlobalKey<CustomButtonState>();
  final TextEditingController report= new TextEditingController();
  final GenericCubit<bool> contactDropCubit = new GenericCubit(false);
  final GenericCubit<bool> socialDropCubit = new GenericCubit(false);
  final GenericCubit<bool> interestDropCubit = new GenericCubit(false);
  final GenericCubit<bool> commentsDropCubit = new GenericCubit(false);
  final GenericCubit<bool> imagesDropCubit = new GenericCubit(false);
  final GenericCubit<bool> filesDropCubit = new GenericCubit(false);
  final GenericCubit<bool> partnersCubit = new GenericCubit(false);
  final GenericCubit<bool> accreditationCubit = new GenericCubit(false);

  void reportComment(
      BuildContext context, int commentId, String kayanId) async {
    await CompanyRepository(context)
        .reportComment(commentId, kayanId, report.text)
        .then((value) {
      report.clear();
      AutoRouter.of(context).pop();
    });
  }
}
