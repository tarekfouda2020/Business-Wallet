import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'wallet_count_state.dart';

class WalletCountCubit extends Cubit<WalletCountState> {
  WalletCountCubit() : super(WalletCountInitial());

  onUpdateCount(int count){
    emit(WalletCountUpdate(count));
  }

  onIncreaseCount(){
    int count = state.count+1;
    onUpdateCount(count);
  }

}
