part of 'branches_cubit.dart';

abstract class BranchesState extends Equatable {
  final List<BranchModel> branches;
  final bool changed;
  const BranchesState(this.branches, this.changed);
}

class BranchesInitial extends BranchesState {
  BranchesInitial() : super([], false);

  @override
  List<Object> get props => [changed,branches];
}


class BranchesUpdateState extends BranchesState {
  BranchesUpdateState(List<BranchModel> branches, bool changed) : super(branches, changed);

  @override
  List<Object> get props => [changed,branches];
}
