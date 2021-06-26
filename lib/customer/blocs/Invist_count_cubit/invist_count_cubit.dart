import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'invist_count_state.dart';

class InvistCountCubit extends Cubit<InvistCountState> {
  InvistCountCubit() : super(InvistCountInitial());

  onUpdateCount(int count){
    emit(InvistCountUpdate(count));
  }

  onIncreaseCount(){
    int count = state.count+1;
    onUpdateCount(count);
  }

}
