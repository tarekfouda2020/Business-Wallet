part of 'invist_count_cubit.dart';

abstract class InvistCountState extends Equatable {
  final int count;
  const InvistCountState(this.count);
}

class InvistCountInitial extends InvistCountState {
  InvistCountInitial() : super(0);

  @override
  List<Object> get props => [count];
}
class InvistCountUpdate extends InvistCountState {
  InvistCountUpdate(int count) : super(count);

  @override
  List<Object> get props => [count];
}
