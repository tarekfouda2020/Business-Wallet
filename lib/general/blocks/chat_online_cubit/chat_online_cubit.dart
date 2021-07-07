import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'chat_online_state.dart';

class ChatOnlineCubit extends Cubit<ChatOnlineState> {
  ChatOnlineCubit() : super(ChatOnlineInitial());

  onUpdateData(bool online){
    emit(ChatOnlineUpdate(online));
  }

}
