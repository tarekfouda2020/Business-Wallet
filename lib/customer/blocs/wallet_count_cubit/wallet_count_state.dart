part of 'wallet_count_cubit.dart';

abstract class WalletCountState extends Equatable {
  final int count;
  const WalletCountState(this.count);
}

class WalletCountInitial extends WalletCountState {
  WalletCountInitial() : super(0);

  @override
  List<Object> get props => [count];
}

class WalletCountUpdate extends WalletCountState {
  WalletCountUpdate(int count) : super(count);

  @override
  List<Object> get props => [count];
}
