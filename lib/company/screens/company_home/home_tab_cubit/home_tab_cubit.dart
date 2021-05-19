import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_tab_state.dart';

class HomeTabCubit extends Cubit<HomeTabState> {
  HomeTabCubit() : super(HomeTabInitial(0));

  onUpdateTab(int index){
    emit(HomeTabUpdate(index));
  }

}
