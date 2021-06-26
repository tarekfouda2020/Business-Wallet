part of 'follow_count_cubit.dart';

abstract class FollowCountState extends Equatable {
  final int count;
  const FollowCountState(this.count);
}

class FollowCountInitial extends FollowCountState {
  FollowCountInitial() : super(0);

  @override
  List<Object> get props => [count];
}

class FollowCountUpdated extends FollowCountState {
  FollowCountUpdated(int count) : super(count);


  @override
  List<Object> get props => [count];
}
