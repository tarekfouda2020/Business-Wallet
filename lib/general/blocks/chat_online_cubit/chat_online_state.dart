part of 'chat_online_cubit.dart';

abstract class ChatOnlineState extends Equatable {
  final bool online;
  const ChatOnlineState(this.online);
}

class ChatOnlineInitial extends ChatOnlineState {
  ChatOnlineInitial() : super(false);

  @override
  List<Object> get props => [online];
}
class ChatOnlineUpdate extends ChatOnlineState {
  ChatOnlineUpdate(bool online) : super(online);

  @override
  List<Object> get props => [online];
}
