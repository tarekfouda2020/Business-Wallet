import 'package:base_flutter/company/models/branch_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'branches_state.dart';

class BranchesCubit extends Cubit<BranchesState> {
  BranchesCubit() : super(BranchesInitial());

  onUpdateData(List<BranchModel> branches){
    emit(BranchesUpdateState(branches, !state.changed));
  }

}
