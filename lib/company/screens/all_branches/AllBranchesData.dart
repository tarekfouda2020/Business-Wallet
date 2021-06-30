part of 'AllBranchesImports.dart';

class AllBranchesData {
  final BranchesCubit branchesCubit = new BranchesCubit();

  fetchData(BuildContext context, {bool refresh = true}) async {
    var data = await CompanyRepository(context).getBranches(refresh);
    branchesCubit.onUpdateData(data);
  }
}
