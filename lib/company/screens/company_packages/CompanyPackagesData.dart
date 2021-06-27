part of 'CompanyPackagesImports.dart';

class CompanyPackagesData {
  final GenericCubit<List<PackagesModel>> packageCubit = new GenericCubit([]);

  void fetchData(BuildContext context) async {
    var data = await CompanyRepository(context).getAllPackages();
    packageCubit.onUpdateData(data);
  }

  void navigate(BuildContext context, int type) {
    if (type == 1) {
      AutoRouter.of(context).push(CompanySubscribeRoute(showVideo: false));
    } else if (type == 2) {
      AutoRouter.of(context).push(CompanySubscribeRoute());
    } else if (type == 3) {
      AutoRouter.of(context).push(CompOpinionSubscribeRoute());
    } else if (type == 4) {
      AutoRouter.of(context).push(CompBrochureSubscribeRoute());
    } else {
      AutoRouter.of(context).push(CompSpecialSubscribeRoute());
    }
  }
}
