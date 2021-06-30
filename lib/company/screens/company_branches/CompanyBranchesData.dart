part of 'CompanyBranchesImports.dart';

class CompanyBranchesData{

  final BranchesCubit branchesCubit =new BranchesCubit();

  fetchData(BuildContext context,{bool refresh = true})async{
    var data = await CompanyRepository(context).getBranches(refresh);
    branchesCubit.onUpdateData(data);
  }

  removeBranch(BuildContext context, BranchModel model)async{
    var result = await CompanyRepository(context).removeBranch(model.id);
    if (result) {
      branchesCubit.state.branches.remove(model);
      branchesCubit.onUpdateData(branchesCubit.state.branches);
    }
  }

}