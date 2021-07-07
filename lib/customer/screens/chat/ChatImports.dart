import 'package:base_flutter/customer/models/MessageModel.dart';
import 'package:base_flutter/customer/resources/CustomerRepository.dart';
import 'package:base_flutter/general/blocks/chat_online_cubit/chat_online_cubit.dart';
import 'package:base_flutter/general/constants/GlobalNotification.dart';
import 'package:base_flutter/general/widgets/DefaultAppBar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'widgets/ChatWidgetImports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'Chat.dart';
part 'ChatData.dart';