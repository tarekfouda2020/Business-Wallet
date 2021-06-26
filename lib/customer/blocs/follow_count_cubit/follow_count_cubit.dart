import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'follow_count_state.dart';

class FollowCountCubit extends Cubit<FollowCountState> {
  FollowCountCubit() : super(FollowCountInitial());

  onUpdateCount(int count){
    emit(FollowCountUpdated(count));
  }

  onIncreaseCount(){
    int count = state.count+1;
    onUpdateCount(count);
  }
}
