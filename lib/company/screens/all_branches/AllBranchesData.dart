part of 'AllBranchesImports.dart';

class AllBranchesData {
  final BranchesCubit branchesCubit = new BranchesCubit();

  fetchData(BuildContext context,String userId, {bool refresh = true}) async {
    var data = await CompanyRepository(context).getBranches(refresh, userId);
    branchesCubit.onUpdateData(data);
  }
}
